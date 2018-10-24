package br.com.shipping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.shipping.model.Permissoes;
import br.com.shipping.model.Usuario;
import br.com.shipping.repository.PermissoesRepository;
import br.com.shipping.repository.UsuarioRepository;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	private UsuarioRepository usuarioRepository;
	@Autowired
	private PermissoesRepository permissoesRepository;
	
	@GetMapping("/")
	public String novo() {
		return "usuario/form";
	}
	
	@PostMapping("/")
	public String salvar(Usuario usuario, BindingResult erros,
			Model model, RedirectAttributes redirect) {
		String pass = usuario.getPassword();
		String encodedPassword = usuario.getEncodedPassword(pass);
		
		usuario.setPassword(encodedPassword);
		usuario.addPermissoes(getPermissoes());
		
		usuarioRepository.save(usuario);
		redirect.addFlashAttribute("mensagem","Usuário criado "
				+ "com sucesso!");
		return "redirect:/login";
	}

	private Permissoes getPermissoes() {
		Permissoes permissoesUsuario = 
				permissoesRepository.findByDescricao("ROLE_USER");
		if (permissoesUsuario == null) {
			permissoesUsuario = new Permissoes();
			permissoesUsuario.setDescricao("ROLE_USER");
			permissoesRepository.save(permissoesUsuario);
		}
		return permissoesUsuario;
	}
}
