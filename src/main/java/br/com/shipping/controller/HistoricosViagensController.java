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

import br.com.shipping.model.HistoricosViagens;
import br.com.shipping.repository.HistoricosViagensRepository;
import br.com.shipping.repository.ViagensRepository;

@Controller
@RequestMapping("/historicosViagens")
public class HistoricosViagensController {

	@Autowired
	private HistoricosViagensRepository historicosViagensRepository;
	@Autowired
	private ViagensRepository viagensRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("historicosViagens", historicosViagensRepository.findAll());
		return "historicosViagens/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model){
		model.addAttribute("viagens", viagensRepository.findAll());
		return "historicosViagens/form";
	}
	
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("viagens", viagensRepository.findAll());
		model.addAttribute("historicosViagens", historicosViagensRepository.findOne(id));
		return "historicosViagens/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST, 
			produces = "application/json")
	@ResponseBody
	public String salvar(@Valid HistoricosViagens historicosViagens, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				historicosViagensRepository.save(historicosViagens);
				
				retorno.put("id", historicosViagens.getId());
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
			historicosViagensRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}
	
}
