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

import br.com.shipping.model.Cidades;
import br.com.shipping.model.Etinerarios;
import br.com.shipping.repository.CidadesRepository;
import br.com.shipping.repository.EtinerariosRepository;

@Controller
@RequestMapping("/etinerarios")
public class EtinerariosController {

	@Autowired
	private CidadesRepository cidadesRepository;
	@Autowired
	private EtinerariosRepository etinerariosRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("etinerarios", etinerariosRepository.findAll());
		return "etinerarios/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model){
		model.addAttribute("cidades", cidadesRepository.findAll());
		return "etinerarios/form";
	}
	
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("cidades", cidadesRepository.findAll());
		model.addAttribute("etinerarios", etinerariosRepository.findOne(id));
		return "etinerarios/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST, 
			produces = "application/json")
	@ResponseBody
	public String salvar(@Valid Etinerarios etinerarios, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				etinerariosRepository.save(etinerarios);
				
				retorno.put("id", etinerarios.getId());
				retorno.put("situacao", "OK");
				retorno.put("mensagem", "Registro salvo com sucesso!");
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao salvar registro!");
		}
		return retorno.toString();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST,
			produces="application/json")
	@ResponseBody
	public String excluir(@PathVariable Long id){
		JSONObject retorno = new JSONObject();
		
		try{
			cidadesRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}
	
}
