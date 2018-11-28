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
import br.com.shipping.repository.CentrosDistribuicaoRepository;
import br.com.shipping.repository.EncomendasRepository;
import br.com.shipping.repository.EntregasRepository;

@Controller
@RequestMapping("/rastreioEncomenda")
public class RastreioEncomendaController {

	@Autowired
	private EncomendasRepository encomendasRepository;
	@Autowired
    private EntregasRepository entregasRepository;
    @Autowired 
	private CentrosDistribuicaoRepository centrosDistribuicaoRepository;
	@Autowired
	private Encomendas_viagensRepository encomendas_viagensRepository;
	@Autowired
	private ViagensRepository viagensRepository;
    
	
	@RequestMapping(value = "/{chaveRastreio}", method = RequestMethod.GET)
	public String list(@PathVariable String chaveRastreio, Model model){
        model.addAttribute("entregas", entregasRepository.findAll());
		model.addAttribute("encomendas", encomendasRepository.findByChaveRastreio(chaveRastreio));
		model.addAttribute("encomendas_viagens", encomendas_viagensRepository.findByEncomenda(encomendasRepository.getId()));
		model.addAttribute("viagens", viagensRepository.findById(Encomendas_viagensRepository.getViagens()));

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
				encomendas = encomendasRepository.findByChaveRastreio(encomendas.getChaveRastreio());
				
				retorno.put("id", encomendas.getId());
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
