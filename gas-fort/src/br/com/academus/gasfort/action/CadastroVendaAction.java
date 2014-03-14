package br.com.academus.gasfort.action;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.form.VendaForm;
import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.Venda;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoVenda;
import br.com.academus.gasfort.modelo.RegistroAuditoria;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class CadastroVendaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();

		VendaForm formulario = (VendaForm) form;
		DAODao daoDao = new DAODao(session);
		
		Venda pedidoAtual = new Venda();

		Cliente cliente = daoDao.loadCliente(formulario.getCliente());
		pedidoAtual.setCliente(cliente);

		FormaPagamento pagamento = daoDao.loadFormaPagamento(formulario.getFormaPagamento());
		pedidoAtual.setFormaPagamento(pagamento);

		pedidoAtual.setData(Calendar.getInstance().getTime());
		
		daoDao.salva(pedidoAtual);
		
		RegistroAuditoria registroAuditoria = new RegistroAuditoria();
		
		Usuario usuario = (Usuario) httpSession.getAttribute("user");
		Menu menu = daoDao.loadMenu(Long.parseLong("8"));
		Acao acao = daoDao.loadAcao(Long.parseLong("1"));
		
		registroAuditoria.setUsuario(usuario);
		registroAuditoria.setMenu(menu);
		registroAuditoria.setAcao(acao);
		registroAuditoria.setData(Calendar.getInstance().getTime());
		
		daoDao.salva(registroAuditoria);

		@SuppressWarnings("unchecked")
		List<ProdutoVenda> produtoVenda = (List<ProdutoVenda>) httpSession.getAttribute("produtoVenda");
		
		for (ProdutoVenda produtoPedido : produtoVenda) {
			
			ProdutoVenda produtoPedidoAtual = new ProdutoVenda();
			
			Venda pedido = daoDao.loadPedido(pedidoAtual.getId());
			produtoPedidoAtual.setPedido(pedido);
			
			Produto produto = daoDao.loadProduto(produtoPedido.getProduto().getId());
			produtoPedidoAtual.setProduto(produto);
			
			produtoPedidoAtual.setValor(produtoPedido.getValor());
			System.out.println(produtoPedido.getValor());
			
			produtoPedidoAtual.setQuantidade(produtoPedido.getQuantidade());

			produtoPedidoAtual.setValor_total(produtoPedido.getValor_total());

			daoDao.salva(produtoPedidoAtual);
			
		}

		session.close();

		httpSession.removeAttribute("produtosPedido");
		return mapping.findForward(retorno);

	}
}