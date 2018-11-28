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

import br.com.shipping.model.Despesas;
import br.com.shipping.repository.DespesasRepository;
import br.com.shipping.repository.TiposDespesaRepository;
import br.com.shipping.repository.ViagensRepository;

@Controller
@RequestMapping("/despesas")
public class DespesasController {

	@Autowired
	private DespesasRepository despesasRepository;
	@Autowired
	private TiposDespesaRepository tiposDespesaRepository;
	@Autowired
	private ViagensRepository viagensRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("cidades", despesasRepository.findAll());
		return "despesas/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model){
		model.addAttribute("tiposDespesa", tiposDespesaRepository.findAll());
		model.addAttribute("viagens", viagensRepository.findAll());
		return "despesas/form";
	}
	
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("tiposDespesa", tiposDespesaRepository.findAll());
		model.addAttribute("despesas", despesasRepository.findOne(id));
		return "despesas/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST, 
			produces = "application/json")
	@ResponseBody
	public String salvar(@Valid Despesas despesa, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				despesasRepository.save(despesa);
				
				retorno.put("id", despesa.getId());
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
			despesasRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}
	
}
