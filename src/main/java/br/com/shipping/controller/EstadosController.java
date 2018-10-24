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

import br.com.shipping.model.Estados;
import br.com.shipping.repository.EstadosRepository;

@Controller
@RequestMapping("/estados")
public class EstadosController {
	
	@Autowired
	private EstadosRepository estadosRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("estados", estadosRepository.findAll());
		return "estados/list";
	}
	
	@RequestMapping(value = "/form")
	public String form(){
		return "estados/form";
	}
	
	@RequestMapping(value = "/form/{id}")
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("estados", estadosRepository.findOne(id));
		return "estados/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST,
			produces = "application/json")
	@ResponseBody
	public String salvar(@Valid Estados estados, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else {
				estadosRepository.save(estados);
				retorno.put("situacao", "OK");
				retorno.put("mensagem", "Registro salvo com sucesso!");
				retorno.put("id", estados.getId());
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
			estadosRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}

}
