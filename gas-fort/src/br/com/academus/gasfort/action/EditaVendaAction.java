package br.com.academus.gasfort.action;

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
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoVenda;
import br.com.academus.gasfort.modelo.Venda;
import br.com.academus.gasfort.util.HibernateUtil;

public class EditaVendaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();

		String retorno = "ok";

		VendaForm formulario = (VendaForm) form;
		DAODao daoDao = new DAODao(session);
		Venda vendaAtual = daoDao.loadPedido(formulario.getId());

		Cliente cliente = daoDao.loadCliente(formulario.getCliente());
		vendaAtual.setCliente(cliente);

		FormaPagamento pagamento = daoDao.loadFormaPagamento(formulario.getFormaPagamento());
		vendaAtual.setFormaPagamento(pagamento);

		daoDao.atualiza(vendaAtual);

		List<ProdutoVenda> venda = daoDao.listaProdutoVenda(vendaAtual);
		
		for (ProdutoVenda produtoVenda : venda) {
			ProdutoVenda produto = daoDao.loadProdutoVenda(produtoVenda.getId());
			daoDao.deleta(produto);
		}

		@SuppressWarnings("unchecked")
		List<ProdutoVenda> produtoVenda = (List<ProdutoVenda>) httpSession.getAttribute("produtoVenda");

		for (ProdutoVenda produtoPedido : produtoVenda) {

			ProdutoVenda produtoPedidoAtual = new ProdutoVenda();

			Venda pedido = daoDao.loadPedido(vendaAtual.getId());
			produtoPedidoAtual.setPedido(pedido);

			Produto produto = daoDao.loadProduto(produtoPedido.getProduto().getId());
			produtoPedidoAtual.setProduto(produto);

			produtoPedidoAtual.setValor(produtoPedido.getValor());

			produtoPedidoAtual.setQuantidade(produtoPedido.getQuantidade());

			produtoPedidoAtual.setValor_total(produtoPedido.getValor_total());

			daoDao.salva(produtoPedidoAtual);

		}

		session.close();

		return mapping.findForward(retorno);
	}
}