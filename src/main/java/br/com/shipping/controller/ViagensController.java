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

import br.com.shipping.model.Viagens;
import br.com.shipping.repository.CentrosDistribuicaoRepository;
import br.com.shipping.repository.FuncionariosRepository;
import br.com.shipping.repository.VeiculosRepository;
import br.com.shipping.repository.ViagensRepository;

@Controller
@RequestMapping("/viagens")
public class ViagensController {
	
	@Autowired
	private ViagensRepository viagensRepository;
	@Autowired
	private FuncionariosRepository funcionariosRepository;
	@Autowired
	private CentrosDistribuicaoRepository centrosDistribuicaoRepository;
	@Autowired
	private VeiculosRepository veiculosRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("viagens", viagensRepository.findAll());
		return "viagens/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model){
		model.addAttribute("funcionarios", funcionariosRepository.findAll());
		model.addAttribute("centrosDistribuicao", centrosDistribuicaoRepository.findAll());
		model.addAttribute("veiculos", veiculosRepository.findAll());
		return "viagens/form";
	}
	
	
	
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("funcionarios", funcionariosRepository.findAll());
		model.addAttribute("centrosDistribuicao", centrosDistribuicaoRepository.findAll());
		model.addAttribute("veiculos", veiculosRepository.findAll());
		model.addAttribute("viagens", viagensRepository.findOne(id));
		return "viagens/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST, 
			produces = "application/json")
	@ResponseBody
	public String salvar(@Valid Viagens viagens, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				viagensRepository.save(viagens);
				
				retorno.put("id", viagens.getId());
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
			viagensRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}

}
