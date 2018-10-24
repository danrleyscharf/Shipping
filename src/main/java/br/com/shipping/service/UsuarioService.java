package br.com.shipping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.shipping.model.Usuario;
import br.com.shipping.repository.UsuarioRepository;

@Service
public class UsuarioService implements UserDetailsService{
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	public UsuarioService(UsuarioRepository usuarioRepository) {
		this.usuarioRepository = usuarioRepository;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario usuario = 
					usuarioRepository.findByUsername(username);
		if (usuario == null) {
			throw new UsernameNotFoundException(
					"Usuário não encontrado");
		}
		return usuario;
	}

}
