package br.com.shipping.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.shipping.model.Encomendas;
import br.com.shipping.model.Encomendas_Viagens;
import br.com.shipping.model.Viagens;
import br.com.shipping.repository.EncomendasRepository;
import br.com.shipping.repository.Encomendas_ViagensRepository;
import br.com.shipping.repository.EntregasRepository;
import br.com.shipping.repository.ViagensRepository;

@Controller
@RequestMapping("/rastreioEncomenda")
public class RastreioEncomendaController {

	@Autowired
	private EncomendasRepository encomendasRepository;
	@Autowired
    private EntregasRepository entregasRepository;
    @Autowired 
	private Encomendas_ViagensRepository encomendas_viagensRepository;
	@Autowired
	private ViagensRepository viagensRepository;
	private List<Viagens> listaViagens;
    
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		return "rastreioEncomenda/form";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String list(String chaveRastreio, Model model){
		
		listaViagens = new ArrayList<>();
		Encomendas encomenda = encomendasRepository.findByChaveRastreio(chaveRastreio);
        model.addAttribute("entregas", entregasRepository.findByEncomendas(encomenda));
		for(Viagens viagem : viagensRepository.findAll()){
			for(Encomendas_Viagens ev : encomendas_viagensRepository.findByEncomenda(encomenda)){
				if(viagem.getId() == ev.getViagem().getId()){
					listaViagens.add(viagem);
				}
			}
		}
		model.addAttribute("viagens", listaViagens);
		
		return "rastreioEncomenda/list";
	}
	
}
