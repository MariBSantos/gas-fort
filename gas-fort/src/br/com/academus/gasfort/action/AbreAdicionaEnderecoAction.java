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
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.Estado;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreAdicionaEnderecoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);
		
		String nomeFantasia = request.getParameter("nomeFantasia");
		Long client = (Long) httpSession.getAttribute("id");
		
		Cliente cliente = daoDao.loadCliente(client);
		List<Estado> estados = daoDao.listaEstados();
		
		httpSession.setAttribute("nomeFantasia", nomeFantasia);
		httpSession.setAttribute("cliente", cliente);
		httpSession.setAttribute("estados", estados);

		return mapping.findForward(retorno);
	}
}