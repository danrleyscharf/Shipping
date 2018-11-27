package br.com.shipping.controller;

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
import br.com.shipping.model.Etinerarios;
import br.com.shipping.model.EtinerariosViagens;
import br.com.shipping.model.Viagens;
import br.com.shipping.repository.EtinerariosRepository;
import br.com.shipping.repository.EtinerariosViagensRepository;
import br.com.shipping.repository.ViagensRepository;

@Controller
@RequestMapping("/vincularEtinerarios")
public class EtinerariosViagensController {

	@Autowired
	private EtinerariosViagensRepository etinerariosViagensRepository;
	@Autowired
	private ViagensRepository viagensRepository;
	@Autowired
	private EtinerariosRepository etinerariosRepository;
	
	
	
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("etinerarios", etinerariosRepository.findAll());
		model.addAttribute("viagens", viagensRepository.findOne(id));
		return "vincularEncomendas/form";
	}
	
	@RequestMapping(value = "/adicionar/{idViagem}/{idEtinerario}", method = RequestMethod.GET,
			produces="application/json")
	@ResponseBody
	public String adicionar(@PathVariable Long idViagem, 
			@PathVariable Long idEtinerario, BindingResult erros, Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{

				Viagens viagem = viagensRepository.findOne(idViagem);
				Etinerarios etinerario = etinerariosRepository.findOne(idEtinerario);
				EtinerariosViagens etinerariosViagens = new EtinerariosViagens();
				
				etinerariosViagens.setViagem(viagem);
				etinerariosViagens.setEtinerario(etinerario);
				etinerariosViagensRepository.save(etinerariosViagens);
				
				retorno.put("situacao", "OK");
				retorno.put("mensagem", "Registro salvo com sucesso!");
			}
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao salvar registro!");
		}
		return retorno.toString();
	}
	
	@RequestMapping(value = "/remover/{id}", method = RequestMethod.POST,
			produces="application/json")
	@ResponseBody
	public String remover(@PathVariable Long id, BindingResult erros, Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao remover registro!");
			}else{
				etinerariosViagensRepository.delete(id);
				
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
