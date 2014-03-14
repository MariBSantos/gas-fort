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
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoCompra;
import br.com.academus.gasfort.util.HibernateUtil;

public class BuscaProdutoCompraAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();

		String currentPage = (String) httpSession.getAttribute("currentPage");

		CompraForm formulario = (CompraForm) form;
		DAODao daoDao = new DAODao(session);

		@SuppressWarnings("unchecked")
		List<ProdutoCompra> produtoCompra = (List<ProdutoCompra>) httpSession.getAttribute("produtoCompra");

		Produto produto = daoDao.loadProduto(formulario.getProduto());
		ProdutoCompra prodCom = new ProdutoCompra();

		prodCom.setProduto(produto);
		prodCom.setValor(formulario.getValor());
		prodCom.setQuantidade(formulario.getQuantidade());
		prodCom.setValor_total(formulario.getValor_total());

		produtoCompra.add(prodCom);

		httpSession.setAttribute("produtoCompra", produtoCompra);

		return new ActionForward(currentPage, true);
	}
}