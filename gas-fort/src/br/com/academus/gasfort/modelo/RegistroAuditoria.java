package br.com.academus.gasfort.modelo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "registro_auditoria")
public class RegistroAuditoria {

	@Id
	@GeneratedValue
	private Long id;
	@JoinColumn(name = "usuario", referencedColumnName = "id")
	@ManyToOne
	private Usuario usuario;
	@JoinColumn(name = "menu", referencedColumnName = "id")
	@ManyToOne
	private Menu menu;
	@JoinColumn(name = "acao", referencedColumnName = "id")
	@ManyToOne
	private Acao acao;
	private Date data;

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

	public Acao getAcao() {
		return acao;
	}

	public void setAcao(Acao acao) {
		this.acao = acao;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
}