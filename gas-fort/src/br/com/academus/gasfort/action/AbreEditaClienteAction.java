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
import br.com.academus.gasfort.modelo.ControleAcesso;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.modelo.Estado;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreEditaClienteAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";
		String menu = "1";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		Usuario usuario = (Usuario) httpSession.getAttribute("user");

		if (usuario == null) {
			retorno = "expirado";
		} else {

			DAODao daoDao = new DAODao(session);
			Menu seletor = new DAODao(session).loadMenu(Long.parseLong(menu));
			ControleAcesso permissao = new DAODao(session).verificaPermissao(usuario, seletor);

			if (usuario.getAdmin() == true || permissao.isEdita() == true)

			{

				String idCliente = (String) request.getParameter("id");
				Cliente cliente = daoDao.loadCliente(Long.parseLong(idCliente));
				List<Endereco> endereco = daoDao.buscaEndereco(cliente);
				List<Estado> estados = daoDao.listaEstados();

				httpSession.setAttribute("cliente", cliente);
				httpSession.setAttribute("endereco", endereco);
				httpSession.setAttribute("estados", estados);
				
				httpSession.setAttribute("currentPage", "/abreEditaCliente.do?id=" + cliente.getId());

			}
			
			else{
				retorno = "negado";
			}
		}
		return mapping.findForward(retorno);
	}
}