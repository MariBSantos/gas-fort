package br.com.academus.gasfort.action;

import java.util.ArrayList;
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
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoCompra;
import br.com.academus.gasfort.util.HibernateUtil;

public class DeletarProdutoCompraAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		
		String currentPage = (String) httpSession.getAttribute("currentPage");
		String product = request.getParameter("id");
		
		DAODao daoDao = new DAODao(session);

		@SuppressWarnings("unchecked")
		List<ProdutoCompra> produtos = (List<ProdutoCompra>) httpSession.getAttribute("produtoCompra");
		
		List<ProdutoCompra> produtoCompra = new ArrayList<>();

		ProdutoCompra prodCom = new ProdutoCompra();

		Produto produto = daoDao.loadProduto(Long.parseLong(product));

		for (ProdutoCompra produtoCompra2 : produtos) {

			if (produto.getId().equals(produtoCompra2.getProduto().getId())) {
				System.out.println("Excluído " + produtoCompra2.getProduto().getDescricao());
			}

			else {
				prodCom.setProduto(produtoCompra2.getProduto());
				prodCom.setValor(produtoCompra2.getValor());
				prodCom.setQuantidade(produtoCompra2.getQuantidade());
				prodCom.setValor_total(produtoCompra2.getValor_total());
				produtoCompra.add(prodCom);
				
				
			}

		}

		httpSession.setAttribute("produtoCompra", produtoCompra);

		return new ActionForward(currentPage, true);
	}
}
