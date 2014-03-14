package br.com.academus.gasfort.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.Compra;
import br.com.academus.gasfort.modelo.ControleAcesso;
import br.com.academus.gasfort.modelo.Empresa;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.modelo.Estado;
import br.com.academus.gasfort.modelo.Estoque;
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


public class HibernateUtil {
	
	private static SessionFactory factory;
	
	static {
		AnnotationConfiguration cfg = new AnnotationConfiguration();
		
		cfg.addAnnotatedClass(Acao.class);
		cfg.addAnnotatedClass(Cliente.class);
		cfg.addAnnotatedClass(Compra.class);
		cfg.addAnnotatedClass(ControleAcesso.class);
		cfg.addAnnotatedClass(Endereco.class);
		cfg.addAnnotatedClass(Estado.class);
		cfg.addAnnotatedClass(Estoque.class);
		cfg.addAnnotatedClass(Empresa.class);
		cfg.addAnnotatedClass(Forma.class);
		cfg.addAnnotatedClass(FormaPagamento.class);
		cfg.addAnnotatedClass(Fornecedor.class);
		cfg.addAnnotatedClass(Menu.class);
		cfg.addAnnotatedClass(Venda.class);
		cfg.addAnnotatedClass(Produto.class);
		cfg.addAnnotatedClass(ProdutoCompra.class);
		cfg.addAnnotatedClass(ProdutoVenda.class);
		cfg.addAnnotatedClass(RegistroAuditoria.class);
		cfg.addAnnotatedClass(Usuario.class);
				
		factory = cfg.buildSessionFactory();		
	}
	
	public Session getSession() {
		Session session = factory.openSession();
		factory.close();		
		return session;
	}

}
