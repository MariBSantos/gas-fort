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
import br.com.academus.gasfort.modelo.ProdutoVenda;
import br.com.academus.gasfort.modelo.Venda;
import br.com.academus.gasfort.util.HibernateUtil;

public class DeletarVendaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		Session session = new HibernateUtil().getSession();

		String idPedido = request.getParameter("id");

		DAODao daoDao = new DAODao(session);
		Venda pedido = daoDao.loadPedido(Long.parseLong(idPedido));
		
		List<ProdutoVenda> produtoVenda = daoDao.listaProdutoVenda(pedido);
		
		for (ProdutoVenda produtoVenda2 : produtoVenda) {
			ProdutoVenda produto = daoDao.loadProdutoVenda(produtoVenda2.getId());
			daoDao.deleta(produto);
		}

		daoDao.deleta(pedido);

		return mapping.findForward(retorno);
	}
}