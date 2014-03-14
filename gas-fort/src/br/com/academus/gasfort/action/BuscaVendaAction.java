package br.com.academus.gasfort.action;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.Venda;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class BuscaVendaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";
		String menu = "8";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		Usuario usuario = (Usuario) httpSession.getAttribute("user");

		if (usuario == null) {
			retorno = "expirado";
		} else {

			DAODao daoDao = new DAODao(session);
			Menu seletor = daoDao.loadMenu(Long.parseLong(menu));
			ControleAcesso permissao = daoDao.verificaPermissao(usuario, seletor);

			if (usuario.getAdmin() == true || permissao.isVisualiza() == true)

			{

				Integer indice = Integer.parseInt(request.getParameter("indice"));
				String valor = request.getParameter("valor");
				String pg = request.getParameter("pg");

				List<Venda> pedidos = daoDao.listaPedidos();

				int inicio = 0;
				int pgIndex = 0;
				int maxResult = 20;
				int local = 1;

				if (!pg.isEmpty()) {
					pgIndex = Integer.parseInt(pg);
					if (pgIndex < 0) {
						pgIndex = 0;
					}
					inicio = Integer.parseInt(pg) * maxResult;
				}

				int proxPg = pgIndex + 1;
				int antPg = pgIndex - 1;

				if (pgIndex == 0) {
					pgIndex = 1;
					httpSession.setAttribute("idxPg", pgIndex);

					pgIndex = 0;
				}

				else {
					pgIndex = pgIndex + 1;
					httpSession.setAttribute("idxPg", pgIndex);

					pgIndex = pgIndex - 1;
				}

				if (indice == 1) {

					if (valor == "") {
						pedidos = daoDao.buscaPedido(maxResult, inicio);
					}

					else {

						pedidos = daoDao.buscaPedidoCodigo(Long.parseLong(valor), maxResult, inicio);
					}
				}

				else if (indice == 2) {
					
					if (valor.equals("-1")) {
						pedidos = daoDao.buscaPedido(maxResult, inicio);
					}

					else {

						Cliente cliente = daoDao.loadCliente(Long.parseLong(valor));
						pedidos = daoDao.buscaPedidoCliente(cliente, maxResult, inicio);
					}
				}

				else {

					if (valor == "") {
						pedidos = daoDao.buscaPedido(maxResult, inicio);
					}

					else {

						Date data = new SimpleDateFormat("dd/MM/yyyy").parse(valor);
						pedidos = daoDao.buscaPedidoData(data, maxResult, inicio);
					}
				}

				httpSession.setAttribute("pedidos", pedidos);

				httpSession.setAttribute("proxPg", proxPg);
				httpSession.setAttribute("antPg", antPg);
				httpSession.setAttribute("local", local);
				httpSession.setAttribute("valor", valor);

				session.close();
			}
		}

		return mapping.findForward(retorno);
	}
}