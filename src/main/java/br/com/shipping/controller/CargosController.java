package br.com.shipping.controller;

import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.shipping.model.Cargos;
import br.com.shipping.repository.CargosRepository;

@Controller
@RequestMapping("/cargos")
public class CargosController {

	@Autowired
	private CargosRepository cargosRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("cargos", cargosRepository.findAll());
		return "cargos/list";
	}
	
	@RequestMapping(value = "/form")
	public String form(){
		return "cargos/form";
	}
	
	@RequestMapping(value = "/form/{id}")
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("cargos", cargosRepository.findOne(id));
		return "cargos/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST,
			produces = "application/json")
	@ResponseBody
	public String salvar(@Valid Cargos cargos, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else {
				cargosRepository.save(cargos);
				retorno.put("situacao", "OK");
				retorno.put("mensagem", "Registro salvo com sucesso!");
				retorno.put("id", cargos.getId());
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao salvar registro! - <br /> " + 
					ex.getMessage());
		}
		
		return retorno.toString();
	}
	
	@RequestMapping(value = "/delete/{id}", produces="application/json", 
			method = RequestMethod.POST)
	@ResponseBody
	public String excluir(@PathVariable Long id){
		JSONObject retorno = new JSONObject();
		
		try{
			cargosRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}
}
