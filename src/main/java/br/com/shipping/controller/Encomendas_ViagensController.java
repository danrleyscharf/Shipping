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
import br.com.shipping.model.Viagens;
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
	int contador;
		
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("encomendas", encomendasRepository.findByEntregue(false));
		model.addAttribute("viagens", viagensRepository.findOne(id));
		return "vincularEncomendas/form";
	}
	
	@RequestMapping(value = "/adicionar/{idViagem}/{idEncomenda}", method = RequestMethod.GET,
			produces="application/json")
	@ResponseBody
	public String adicionar(@PathVariable Long idViagem, 
			@PathVariable Long idEncomenda, @Valid Encomendas_Viagens encomendas_viagens,
			BindingResult erros, Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{

				contador = 0;

				Viagens viagem = viagensRepository.findOne(idViagem);
				Encomendas encomenda = encomendasRepository.findOne(idEncomenda);
				Encomendas_Viagens encomendasViagens = new Encomendas_Viagens();
				
				encomendasViagens.setViagem(viagem);
				encomendasViagens.setEncomenda(encomenda);

				for(Encomendas_Viagens ev : encomendas_ViagensRepository.findAll()){
					if((ev.getViagem() == viagem) && (ev.getEncomenda() == encomenda)){
						contador++;
					}
				}

				if(contador > 0){
					retorno.put("situacao", "ERRO");
					retorno.put("mensagem", "Registro já foi vinculado!");
				}else{
					encomendas_ViagensRepository.save(encomendasViagens);
				
					retorno.put("situacao", "OK");
					retorno.put("mensagem", "Registro salvo com sucesso!");
				}
				
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao salvar registro!");
		}
		return retorno.toString();
	}
	
	@RequestMapping(value = "/remover/{idViagem}/{idEncomenda}", method = RequestMethod.GET,
			produces="application/json")
	@ResponseBody
	public String remover(@PathVariable Long idViagem, @PathVariable Long idEncomenda, 
	@Valid Encomendas_Viagens encomendas_viagens, BindingResult erros, Model model){
		
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao remover registro!");
			}else{

				Encomendas encomenda = encomendasRepository.findOne(idEncomenda);
				Viagens viagem = viagensRepository.findOne(idViagem);
				
				for(Encomendas_Viagens ev : encomendas_ViagensRepository.findByEncomenda(encomenda)){
					if(ev.getViagem().getId() == viagem.getId()){
						if( ev.equals(null) ){
							retorno.put("situacao", "ERRO");
							retorno.put("mensagem", "Este registro não está vinculado!");
						}else{
							encomendas_ViagensRepository.delete(ev);
							
							retorno.put("situacao", "OK");
							retorno.put("mensagem", "Registro excluído com sucesso!");
						}
						
					}
					
				}

				
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		return retorno.toString();
	}
	
}
