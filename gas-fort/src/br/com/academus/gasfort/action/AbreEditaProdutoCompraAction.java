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
import org.json.JSONObject;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoCompra;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreEditaProdutoCompraAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		String productEdit = request.getParameter("produto");

		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		@SuppressWarnings("unchecked")
		List<ProdutoCompra> produtos = (List<ProdutoCompra>) httpSession.getAttribute("produtoCompra");
		Produto produtoEdicao = daoDao.loadProduto(Long.parseLong(productEdit));

		for (ProdutoCompra produ : produtos) {

			if (produ.getProduto().getId().equals(produtoEdicao.getId())) {

				JSONObject object = new JSONObject();

				object.put("produto", produ.getProduto().getId());
				object.put("valor", produ.getValor());
				object.put("quantidade", produ.getQuantidade());
				object.put("valor_total", produ.getValor_total());

				String jsonResult = object.toString();

				response.setContentType("text/javascript; charset=utf-8");
				response.getWriter().write(jsonResult);

				httpSession.setAttribute("produ", produ);
			}
		}
		return null;
	}

}