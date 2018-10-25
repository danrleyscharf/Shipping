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
import br.com.shipping.repository.EncomendasRepository;
import br.com.shipping.repository.ViagensRepository;
import br.com.shipping.repository.EntregasRepository;

@Controller
@RequestMapping("/rastreioEncomenda")
public class EncomendasController {

	@Autowired
	private EncomendasRepository encomendasRepository;
	@Autowired
    private ViagensRepository viagensRepository;
    @Autowired 
    private EntregasRepository entregasRepository;
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String list(Model model){
        model.addAttribute("centrosDistribuicao", centrosDistribuicaoRepository.findAll());
        model.addAttribute("entregas", entregasRepository.findAll());
		model.addAttribute("encomendas", encomendasRepository.findOne(id));
		return "rastreioEncomenda/list";
	}
	
	@RequestMapping(value = "/form/", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
        return "rastreioEncomenda/form";
	}
	
	
	@RequestMapping(value = "/{chaveRastreio}", method = RequestMethod.POST, 
			produces = "application/json")
	@ResponseBody
	public String rastrear(@Valid Encomendas encomendas, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				encomendas = encomendasRepository.findByChaveRastreio(chaveRastreio);
				
				retorno.put("id", encomendas.id);
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
			encomendasRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}
}
