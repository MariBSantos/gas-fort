package br.com.academus.gasfort.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Compra;
import br.com.academus.gasfort.modelo.ProdutoCompra;
import br.com.academus.gasfort.util.HibernateUtil;

public class DeletarCompraAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		Session session = new HibernateUtil().getSession();

		String idCompra = request.getParameter("id");

		DAODao daoDao = new DAODao(session);
		Compra compra = daoDao.loadCompra(Long.parseLong(idCompra));

		List<ProdutoCompra> produtoCompra = daoDao.listaProdutoCompra(compra);
		
		for (ProdutoCompra produtoCompra2 : produtoCompra) {
			System.out.println(produtoCompra2.getProduto().getDescricao());
			
		}

		for (ProdutoCompra produtoCompra2 : produtoCompra) {
			ProdutoCompra prodCompra = daoDao.loadProdutoCompra(produtoCompra2.getId());
			daoDao.deleta(prodCompra);
		}

		daoDao.deleta(compra);

		return mapping.findForward(retorno);
	}
}