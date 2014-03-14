package br.com.academus.gasfort.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Empresa;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreCadastroEmpresaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();

			Session session = new HibernateUtil().getSession();
			
			String idEmpresa = ("1");

			Empresa empresa = new DAODao(session).loadEmpresa(Long.parseLong(idEmpresa));

			httpSession.setAttribute("empresa", empresa);

			//session.close();

			return mapping.findForward(retorno);
	}
}