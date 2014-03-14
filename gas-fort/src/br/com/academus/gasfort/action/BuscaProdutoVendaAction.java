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
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoVenda;
import br.com.academus.gasfort.util.HibernateUtil;

public class BuscaProdutoVendaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		
		String currentPage = (String) httpSession.getAttribute("currentPage");
		
		VendaForm formulario = (VendaForm) form;
		DAODao daoDao = new DAODao(session);

		@SuppressWarnings("unchecked")
		List<ProdutoVenda> produtoVenda = (List<ProdutoVenda>) httpSession.getAttribute("produtoVenda");

		Produto produto = daoDao.loadProduto(formulario.getProduto());
		ProdutoVenda prodPed = new ProdutoVenda();
		prodPed.setProduto(produto);
		System.out.println(formulario.getValor());
		prodPed.setValor(formulario.getValor());
		prodPed.setQuantidade(formulario.getQuantidade());
		prodPed.setValor_total(formulario.getValor_total());

		produtoVenda.add(prodPed);

		httpSession.setAttribute("produtoVenda", produtoVenda);
		httpSession.setAttribute("aba", 2);
		

		return new ActionForward(currentPage, true);
	}
}