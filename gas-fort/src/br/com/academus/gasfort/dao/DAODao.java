package br.com.academus.gasfort.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.Compra;
import br.com.academus.gasfort.modelo.ControleAcesso;
import br.com.academus.gasfort.modelo.Empresa;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.modelo.Estado;
import br.com.academus.gasfort.modelo.Forma;
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.modelo.Fornecedor;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.Venda;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoCompra;
import br.com.academus.gasfort.modelo.ProdutoVenda;
import br.com.academus.gasfort.modelo.RegistroAuditoria;
import br.com.academus.gasfort.modelo.Usuario;

public class DAODao {

	private Session session;

	// CLIENTE

	public DAODao(Session session) {
		this.session = session;
	}

	public Cliente loadCliente(Long id) {
		return (Cliente) this.session.load(Cliente.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> listaClientes() {
		return this.session.createCriteria(Cliente.class)
				.addOrder(Order.asc("nomeFantasia")).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Cliente> listaClienteCodigo(Long codigo, int quantidade, int inicio) {
		return this.session
				.createCriteria(Cliente.class)
				.add(Restrictions.eq("id", codigo))
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> listaClienteNomeFantasia(String valor, int quantidade, int inicio) {
		return this.session
				.createCriteria(Cliente.class)
				.add(Restrictions.ilike("nomeFantasia", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("nomeFantasia")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> listaClienteRazao(String valor, int quantidade, int inicio) {
		return this.session
				.createCriteria(Cliente.class)
				.add(Restrictions.ilike("razaoSocial", valor, MatchMode.ANYWHERE)).addOrder(Order.asc("razaoSocial"))
				.setMaxResults(quantidade).setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> listaClienteCNPJ(String valor, int quantidade,
			int inicio) {
		return this.session.createCriteria(Cliente.class)
				.add(Restrictions.ilike("cnpj", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("cnpj")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	public void salva(Cliente cliente) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(cliente);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(Cliente cliente) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(cliente);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void deleta(Cliente cliente) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(cliente);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public boolean verificaCliente(Long idCliente) {
		return this.session.createCriteria(Cliente.class)
				.add(Restrictions.eq("id", idCliente)).list().isEmpty();
	}

	// FORMA DE PAGAMENTO

	public FormaPagamento loadFormaPagamento(Long id) {
		return (FormaPagamento) this.session.load(FormaPagamento.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<FormaPagamento> listaFormaPagamento() {
		return this.session.createCriteria(FormaPagamento.class)
				.addOrder(Order.asc("id")).list();
	}

	@SuppressWarnings("unchecked")
	public List<FormaPagamento> buscaFormaPagamento(String valor, int quantidade, int inicio) {
		return this.session
				.createCriteria(FormaPagamento.class)
				.add(Restrictions.ilike("descricaoForma", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("descricaoForma"))
				.setMaxResults(quantidade).setFirstResult(inicio).list();
	}

	public void deleta(Venda pedido) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(pedido);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void salva(FormaPagamento formaPagamento) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(formaPagamento);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(FormaPagamento formaPagamento) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(formaPagamento);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void deleta(FormaPagamento formaPagamento) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(formaPagamento);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	// FORMA

	public Forma loadForma(Long id) {
		return (Forma) this.session.load(Forma.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Forma> listaForma() {
		return this.session.createCriteria(Forma.class)
				.addOrder(Order.asc("id")).list();
	}

	// FORNECEDOR

	public Fornecedor loadFornecedor(Long id) {
		return (Fornecedor) this.session.load(Fornecedor.class, id);
	}

	public void salva(Fornecedor fornecedor) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(fornecedor);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Fornecedor> listaFornecedores() {
		return this.session.createCriteria(Fornecedor.class)
				.addOrder(Order.asc("id")).list();
	}

	public void atualiza(Fornecedor fornecedor) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(fornecedor);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void deleta(Fornecedor fornecedor) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(fornecedor);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public boolean verificaFornecedor(Long idFornecedor) {
		return this.session.createCriteria(Fornecedor.class)
				.add(Restrictions.eq("id", idFornecedor)).list().isEmpty();
	}

	@SuppressWarnings("unchecked")
	public List<Fornecedor> buscaFornecedor(String valor, int quantidade,
			int inicio) {
		return this.session
				.createCriteria(Fornecedor.class)
				.add(Restrictions.ilike("nomeFantasia", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("nomeFantasia")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Fornecedor> buscaFornecedorRazao(String valor, int quantidade,
			int inicio) {
		return this.session
				.createCriteria(Fornecedor.class)
				.add(Restrictions.ilike("razaoSocial", valor, MatchMode.ANYWHERE)).addOrder(Order.asc("razaoSocial"))
				.setMaxResults(quantidade).setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Fornecedor> buscaFornecedorCNPJ(String valor, int quantidade,
			int inicio) {
		return this.session.createCriteria(Fornecedor.class)
				.add(Restrictions.ilike("cnpj", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("cnpj")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	// PRODUTO

	public Produto loadProduto(Long id) {
		return (Produto) this.session.load(Produto.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Produto> listaProdutos() {
		return this.session.createCriteria(Produto.class)
				.addOrder(Order.asc("id")).list();
	}

	@SuppressWarnings("unchecked")
	public List<Produto> buscaProduto(String valor, int quantidade, int inicio) {
		return this.session
				.createCriteria(Produto.class)
				.add(Restrictions.ilike("descricao", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> listaProdutoCodigo(Long codigo, int quantidade, int inicio) {
		return this.session
				.createCriteria(Produto.class)
				.add(Restrictions.eq("id", codigo))
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> listaProdutoSigla(String valor, int quantidade, int inicio) {
		return this.session
				.createCriteria(Produto.class)
				.add(Restrictions.ilike("sigla", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	public void salva(Produto produto) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(produto);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(Produto produto) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(produto);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void deleta(Produto produto) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(produto);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	// EMPRESA

	public Empresa loadEmpresa(Long id) {
		return (Empresa) this.session.load(Empresa.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Empresa> listaEmpresa() {
		return this.session.createCriteria(Empresa.class)
				.addOrder(Order.asc("nomeFantasia")).list();
	}

	public void atualiza(Empresa empresa) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(empresa);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	// ENDEREÇO

	public Endereco loadEndereco(Long id) {
		return (Endereco) this.session.load(Endereco.class, id);
	}

	public Endereco loadEndereco(Cliente cliente) {
		return (Endereco) this.session.createCriteria(Endereco.class)
				.add(Restrictions.eq("cliente", cliente)).setMaxResults(1)
				.uniqueResult();
	}

	public void salva(Endereco endereco) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(endereco);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(Endereco endereco) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(endereco);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Endereco> buscaEndereco(Cliente cliente) {
		return this.session.createCriteria(Endereco.class)
				.add(Restrictions.eq("cliente", cliente))
				.addOrder(Order.asc("id")).list();
	}

	public void deleta(Endereco endereco) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(endereco);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public Estado loadEstado(Long id) {
		return (Estado) this.session.load(Estado.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Estado> listaEstados() {
		return this.session.createCriteria(Estado.class)
				.addOrder(Order.asc("id")).list();
	}

	// USUÁRIO

	public Usuario loadUsuario(Long id) {
		return (Usuario) this.session.load(Usuario.class, id);
	}

	public void salva(Usuario usuario) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(usuario);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void deleta(Usuario usuario) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(usuario);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(Usuario usuario) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(usuario);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> buscaUsuario(String valor, int quantidade, int inicio) {
		return this.session.createCriteria(Usuario.class)
				.add(Restrictions.ilike("nome", valor, MatchMode.ANYWHERE))
				.addOrder(Order.asc("nome")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> listaUsuarios() {
		return this.session.createCriteria(Usuario.class)
				.addOrder(Order.asc("nome")).list();
	}

	@SuppressWarnings("unchecked")
	public List<ControleAcesso> listaControle(Usuario usuario) {
		return this.session.createCriteria(ControleAcesso.class)
				.add(Restrictions.eq("usuario", usuario))
				.addOrder(Order.asc("id")).list();
	}

	public void salva(ControleAcesso controleAcesso) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(controleAcesso);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(ControleAcesso controleAcesso) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(controleAcesso);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public ControleAcesso verificaPermissao(Usuario usuario, Menu menu) {
		return (ControleAcesso) this.session
				.createCriteria(ControleAcesso.class)
				.add(Restrictions.eq("usuario", usuario))
				.add(Restrictions.eq("menu", menu)).uniqueResult();
	}

	public Usuario verificaLogin(String login, String senha) {
		return (Usuario) this.session.createCriteria(Usuario.class)
				.add(Restrictions.eq("ativo", true))
				.add(Restrictions.like("login", login, MatchMode.EXACT))
				.add(Restrictions.like("senha", senha, MatchMode.EXACT))
				.uniqueResult();
	}

	// VENDA

	public Venda loadPedido(Long id) {
		return (Venda) this.session.load(Venda.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Venda> listaPedidos() {
		return this.session.createCriteria(Venda.class)
				.addOrder(Order.asc("id")).list();
	}

	@SuppressWarnings("unchecked")
	public List<Venda> buscaPedido(int quantidade, int inicio) {
		return this.session.createCriteria(Venda.class)
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Venda> buscaPedidoCodigo(Long valor, int quantidade, int inicio) {
		return this.session.createCriteria(Venda.class)
				.add(Restrictions.eq("id", valor)).addOrder(Order.asc("id"))
				.setMaxResults(quantidade).setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Venda> buscaPedidoCliente(Cliente valor, int quantidade,
			int inicio) {
		return this.session.createCriteria(Venda.class)
				.add(Restrictions.eq("cliente", valor))
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Venda> buscaPedidoData(Date valor, int quantidade, int inicio) {
		return this.session.createCriteria(Venda.class)
				.add(Restrictions.eq("data", valor)).addOrder(Order.asc("id"))
				.setMaxResults(quantidade).setFirstResult(inicio).list();
	}

	public void salva(Venda pedido) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(pedido);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(Venda venda) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(venda);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	// PRODUTOS PEDIDO

	public ProdutoVenda loadProdutoVenda(Long id) {
		return (ProdutoVenda) this.session.load(ProdutoVenda.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<ProdutoVenda> listaProdutoVenda(Venda pedido) {
		return this.session.createCriteria(ProdutoVenda.class)
				.add(Restrictions.eq("pedido", pedido))
				.addOrder(Order.asc("id")).list();
	}

	public void deleta(ProdutoVenda produtoVenda) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(produtoVenda);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void salva(ProdutoVenda produtoPedido) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(produtoPedido);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(ProdutoVenda produtoPedido) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(produtoPedido);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	// COMPRAS

	public Compra loadCompra(Long id) {
		return (Compra) this.session.load(Compra.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Compra> listaCompras() {
		return this.session.createCriteria(Compra.class)
				.addOrder(Order.asc("id")).list();
	}

	@SuppressWarnings("unchecked")
	public List<Compra> buscaCompra(int quantidade, int inicio) {
		return this.session.createCriteria(Compra.class)
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Compra> buscaCompraCodigo(Long valor, int quantidade, int inicio) {
		return this.session.createCriteria(Compra.class)
				.add(Restrictions.eq("id", valor)).addOrder(Order.asc("id"))
				.setMaxResults(quantidade).setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Compra> buscaCompraFornecedor(Fornecedor valor, int quantidade,
			int inicio) {
		return this.session.createCriteria(Compra.class)
				.add(Restrictions.eq("fornecedor", valor))
				.addOrder(Order.asc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	@SuppressWarnings("unchecked")
	public List<Compra> buscaCompraData(Date valor, int quantidade, int inicio) {
		return this.session.createCriteria(Compra.class)
				.add(Restrictions.eq("data", valor)).addOrder(Order.asc("id"))
				.setMaxResults(quantidade).setFirstResult(inicio).list();
	}

	public void salva(Compra compra) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(compra);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	public void atualiza(Compra compra) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.update(compra);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}
	
	public void deleta(Compra compra) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(compra);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

	// PRODUTO COMPRA
	
	public ProdutoCompra loadProdutoCompra(Long id) {
		return (ProdutoCompra) this.session.load(ProdutoCompra.class, id);
	}


	@SuppressWarnings("unchecked")
	public List<ProdutoCompra> listaProdutoCompra(Compra compra) {
		return this.session.createCriteria(ProdutoCompra.class)
				.add(Restrictions.eq("compra", compra))
				.addOrder(Order.asc("id")).list();
	}

	public void salva(ProdutoCompra produtoCompra) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(produtoCompra);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}
	
	public void deleta(ProdutoCompra produtoCompra) {
		Transaction tx = session.beginTransaction();
		try {
			session.delete(produtoCompra);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}


	// ACAO

	public Acao loadAcao(Long id) {
		return (Acao) this.session.load(Acao.class, id);
	}

	// MENU

	public Menu loadMenu(Long id) {
		return (Menu) this.session.load(Menu.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Menu> listaMenu() {
		return this.session.createCriteria(Menu.class)
				.addOrder(Order.asc("id")).list();
	}

	// REGISTRO AUDITORIA

	@SuppressWarnings("unchecked")
	public List<RegistroAuditoria> listaAuditoria() {
		return this.session.createCriteria(RegistroAuditoria.class)
				.addOrder(Order.asc("id")).list();
	}

	@SuppressWarnings("unchecked")
	public List<RegistroAuditoria> buscaAuditoria(Date dataInicial,
			Date dataFinal, int quantidade, int inicio) {
		return this.session.createCriteria(RegistroAuditoria.class)
				.add(Restrictions.ge("data", dataInicial))
				.add(Restrictions.le("data", dataFinal))
				.addOrder(Order.desc("id")).setMaxResults(quantidade)
				.setFirstResult(inicio).list();
	}

	public void salva(RegistroAuditoria registroAuditoria) {
		Transaction tx = this.session.beginTransaction();
		try {
			this.session.save(registroAuditoria);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
	}

}