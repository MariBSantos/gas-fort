package br.com.academus.gasfort.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.util.HibernateUtil;

public class DeletarEnderecoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		String idEndereco = request.getParameter("id");
		Endereco endereco = daoDao.loadEndereco(Long.parseLong(idEndereco));

		daoDao.deleta(endereco);

		return mapping.findForward(retorno);
	}
}