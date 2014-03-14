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
import br.com.academus.gasfort.form.CompraForm;
import br.com.academus.gasfort.modelo.Compra;
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.modelo.Fornecedor;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoCompra;
import br.com.academus.gasfort.util.HibernateUtil;

public class EditaCompraAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();

		String retorno = "ok";

		CompraForm formulario = (CompraForm) form;
		DAODao daoDao = new DAODao(session);
		Compra compraAtual = daoDao.loadCompra(formulario.getId());

		Fornecedor fornecedor = daoDao.loadFornecedor(formulario
				.getFornecedor());
		compraAtual.setFornecedor(fornecedor);

		FormaPagamento pagamento = daoDao.loadFormaPagamento(formulario.getFormaPagamento());
		compraAtual.setFormaPagamento(pagamento);

		daoDao.atualiza(compraAtual);

		List<ProdutoCompra> venda = daoDao.listaProdutoCompra(compraAtual);

		for (ProdutoCompra produtoCompra : venda) {
			ProdutoCompra compra = daoDao.loadProdutoCompra(produtoCompra.getId());
			daoDao.deleta(compra);
		}

		@SuppressWarnings("unchecked")
		List<ProdutoCompra> produtoCompra = (List<ProdutoCompra>) httpSession.getAttribute("produtoCompra");

		for (ProdutoCompra produtoCompra2 : produtoCompra) {

			ProdutoCompra produtoCompraAtual = new ProdutoCompra();

			Compra compra = daoDao.loadCompra(compraAtual.getId());
			produtoCompraAtual.setCompra(compra);
			
			Produto produto = daoDao.loadProduto(produtoCompra2.getProduto().getId());
			produtoCompraAtual.setProduto(produto);

			produtoCompraAtual.setValor(produtoCompra2.getValor());

			produtoCompraAtual.setQuantidade(produtoCompra2.getQuantidade());

			produtoCompraAtual.setValor_total(produtoCompra2.getValor_total());

			daoDao.salva(produtoCompraAtual);

		}

		session.close();

		return mapping.findForward(retorno);
	}
}