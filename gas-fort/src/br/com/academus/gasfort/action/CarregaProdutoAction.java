package br.com.academus.gasfort.action;

import java.text.NumberFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.json.JSONObject;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.util.HibernateUtil;

public class CarregaProdutoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String idProduto = request.getParameter("produto");

		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		Produto produto = daoDao.loadProduto(Long.parseLong(idProduto));
		NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance();

		JSONObject object = new JSONObject();

		object.put("id", produto.getId());
		object.put("descricao", produto.getDescricao());
		object.put("volume", produto.getVolume());
		object.put("valor", formatoMoeda.format(produto.getValor()));

		String jsonResult = object.toString();

		response.setContentType("text/javascript; charset=utf-8");
		response.getWriter().write(jsonResult);

		return null;
	}

}