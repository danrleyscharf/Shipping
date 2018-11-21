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

import br.com.shipping.model.Encomendas;
import br.com.shipping.model.Encomendas_Viagens;
import br.com.shipping.repository.EncomendasRepository;
import br.com.shipping.repository.Encomendas_ViagensRepository;
import br.com.shipping.repository.ViagensRepository;

@Controller
@RequestMapping("/vincularEncomendas")
public class Encomendas_ViagensController {

	@Autowired
	private Encomendas_ViagensRepository encomendas_ViagensRepository;
	@Autowired
	private EncomendasRepository encomendasRepository; 
	@Autowired
	private ViagensRepository viagensRepository;
		
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("encomendas", encomendasRepository.findByEntregue(false));
		model.addAttribute("viagens", viagensRepository.findOne(id));
		return "vincularEncomendas/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST, 
			produces = "application/json")
	@ResponseBody
	
	
	public String salvar(@Valid Encomendas encomendas, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				encomendasRepository.save(encomendas);
				
				retorno.put("id", encomendas.getId());
				retorno.put("situacao", "OK");
				retorno.put("mensagem", "Registro salvo com sucesso!");
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao salvar registro!");
		}
		return retorno.toString();
	}
	
	@RequestMapping(value = "/adicionar/{idViagem}/{idEncomenda}", method = RequestMethod.GET,
			produces="application/json")
	@ResponseBody
	public String adicionar(@PathVariable Long idViagem, 
			@PathVariable Long idEncomenda, BindingResult erros, Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				
				//encomendas_ViagensRepository.save(encomendas_viagens);
				
				retorno.put("situacao", "OK");
				retorno.put("mensagem", "Registro salvo com sucesso!");
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao salvar registro!");
		}
		return retorno.toString();
	}
	
	@RequestMapping(value = "/remover/{idViagem}/{idEncomenda}", method = RequestMethod.POST,
			produces="application/json")
	@ResponseBody
	public String remover(@Valid Encomendas_Viagens encomendas_viagens, @PathVariable Long idViagem, 
			@PathVariable Long idEncomenda, BindingResult erros, Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				encomendas_ViagensRepository.save(encomendas_viagens);
				
				retorno.put("id", encomendas_viagens.getId());
				retorno.put("idViagem", idViagem);
				retorno.put("idEncomenda", idEncomenda);
				retorno.put("situacao", "OK");
				retorno.put("mensagem", "Registro salvo com sucesso!");
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao salvar registro!");
		}
		return retorno.toString();
	}
	
}
