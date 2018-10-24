package br.com.shipping.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Getter;
import lombok.Setter;

@Entity
public class Usuario implements UserDetails{
	
	private static final long serialVersionUID = 1L;
	private static final BCryptPasswordEncoder bCrypt = 
			new BCryptPasswordEncoder(10);
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Getter @Setter	
	private Long id;
	
	@Column(length = 100, nullable = false)
	@Getter @Setter
	private String nome;
	
	@Setter
	@Column(length = 100, nullable = false)
	private String username;
	
	@Setter
	@Column(length = 512, nullable = false)
	private String password;
	
	@ManyToMany(cascade = CascadeType.ALL, 
			fetch = FetchType.EAGER)
	@Setter @Getter
	private Set<Permissoes> permissoesUsuario;
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auto = new ArrayList<>();
		auto.addAll(getPermissoesUsuario());
		
		return auto;
	}
	
	public void addPermissoes(Permissoes permissoes) {
		if (permissoesUsuario == null) {
			permissoesUsuario = new HashSet<>();
		}
		permissoesUsuario.add(permissoes);
	}
	
	public String getEncodedPassword(String pass) {
		if (StringUtils.isNotEmpty(pass)) {
			return bCrypt.encode(pass);
		}
		return pass;
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
