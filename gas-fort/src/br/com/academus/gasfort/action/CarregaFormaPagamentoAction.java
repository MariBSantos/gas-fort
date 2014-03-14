package br.com.academus.gasfort.action;

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
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.util.HibernateUtil;

public class CarregaFormaPagamentoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		String idFormaPagamento = request.getParameter("formaPagamento");

		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		FormaPagamento formaPagamento = daoDao.loadFormaPagamento(Long.parseLong(idFormaPagamento));

		JSONObject object = new JSONObject();

		object.put("id", formaPagamento.getId());
		object.put("descricaoForma", formaPagamento.getDescricaoForma());
		object.put("forma", formaPagamento.getForma());
		object.put("parcelas", formaPagamento.getParcelas());


		String jsonResult = object.toString();

		response.setContentType("text/javascript; charset=utf-8");
		response.getWriter().write(jsonResult);
		
		httpSession.setAttribute("formaPagamento", formaPagamento);

		return null;
	}

}