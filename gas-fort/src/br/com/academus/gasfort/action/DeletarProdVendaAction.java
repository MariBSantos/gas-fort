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
import br.com.academus.gasfort.modelo.ProdutoVenda;
import br.com.academus.gasfort.util.HibernateUtil;

public class DeletarProdVendaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		String product = request.getParameter("id");

		@SuppressWarnings("unchecked")
		List<ProdutoVenda> produtos = (List<ProdutoVenda>) httpSession.getAttribute("produtoVenda");

		List<ProdutoVenda> produtoVenda = new ArrayList<>();

		ProdutoVenda prodPed = new ProdutoVenda();

		Produto produto = daoDao.loadProduto(Long.parseLong(product));

		for (ProdutoVenda produtoPedido : produtos) {

			if (produto.getId().equals(produtoPedido.getProduto().getId())) {
				System.out.println("Excluído " + produtoPedido.getProduto().getDescricao());
			}

			else {
				prodPed.setProduto(produtoPedido.getProduto());
				produtoVenda.add(prodPed);
			}

		}

		httpSession.setAttribute("produtoVenda", produtoVenda);

		return mapping.findForward(retorno);
	}
}
