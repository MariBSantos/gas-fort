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
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.Venda;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreBuscaVendaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("pg");
		httpSession.removeAttribute("valor");
		httpSession.removeAttribute("local");

		Session session = new HibernateUtil().getSession();

		List<Venda> pedidos = new ArrayList<Venda>();
		List<Cliente> clientes = new DAODao(session).listaClientes();

		httpSession.setAttribute("pedidos", pedidos);
		httpSession.setAttribute("clientes", clientes);

		session.close();

		return mapping.findForward(retorno);

	}
}