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

import br.com.shipping.model.Funcionarios;
import br.com.shipping.repository.CargosRepository;
import br.com.shipping.repository.CentrosDistribuicaoRepository;
import br.com.shipping.repository.FuncionariosRepository;
import br.com.shipping.repository.UsuarioRepository;

@Controller
@RequestMapping("/funcionarios")
public class FuncionariosController {

	@Autowired
	private FuncionariosRepository funcionariosRepository;
	@Autowired
	private UsuarioRepository usuarioRepository;
	@Autowired
	private CargosRepository cargosRepository;
	@Autowired
	private CentrosDistribuicaoRepository centrosDistribuicaoRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model){
		model.addAttribute("funcionarios", funcionariosRepository.findAll());
		return "funcionarios/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model){
		model.addAttribute("usuario", usuarioRepository.findAll());
		model.addAttribute("cargos", cargosRepository.findAll());
		model.addAttribute("centrosDistribuicao", centrosDistribuicaoRepository.findAll());
		return "funcionarios/form";
	}
	
	@RequestMapping(value = "/form/{id}", method = RequestMethod.GET)
	public String form(@PathVariable Long id, Model model){
		model.addAttribute("usuario", usuarioRepository.findAll());
		model.addAttribute("cargos", cargosRepository.findAll());
		model.addAttribute("centrosDistribuicao", centrosDistribuicaoRepository.findAll());
		model.addAttribute("funcionarios", funcionariosRepository.findOne(id));
		return "funcionarios/form";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST, 
			produces = "application/json")
	@ResponseBody
	public String salvar(@Valid Funcionarios funcionarios, BindingResult erros, 
			Model model){
		JSONObject retorno = new JSONObject();
		try{
			if (erros.hasErrors()){
				retorno.put("situacao", "ERRO");
				retorno.put("mensagem", "Falha ao salvar registro!");
			}else{
				funcionariosRepository.save(funcionarios);
				
				retorno.put("id", funcionarios.getId());
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
			funcionariosRepository.delete(id);
			retorno.put("situacao", "OK");
			retorno.put("mensagem", "Registro removido com sucesso!");
		}catch (Exception ex){
			retorno.put("situacao", "ERRO");
			retorno.put("mensagem", "Falha ao remover registro!");
		}
		
		return retorno.toString();
	}
	
}
