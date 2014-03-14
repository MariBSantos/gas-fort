package br.com.academus.gasfort.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "controle_acesso")
public class ControleAcesso {
	
	@Id
	@GeneratedValue
	private Long id;
	@JoinColumn(name="usuario", referencedColumnName="id") 
	@ManyToOne
	private Usuario usuario;
	@JoinColumn(name="menu", referencedColumnName="id") 
	@ManyToOne
	private Menu menu;
	private boolean cria;
	private boolean edita;
	private boolean deleta;
	private boolean visualiza;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public boolean isCria() {
		return cria;
	}
	public void setCria(boolean cria) {
		this.cria = cria;
	}
	public boolean isEdita() {
		return edita;
	}
	public void setEdita(boolean edita) {
		this.edita = edita;
	}
	public boolean isDeleta() {
		return deleta;
	}
	public void setDeleta(boolean deleta) {
		this.deleta = deleta;
	}
	public boolean isVisualiza() {
		return visualiza;
	}
	public void setVisualiza(boolean visualiza) {
		this.visualiza = visualiza;
	}

}
