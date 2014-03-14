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
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.Venda;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoVenda;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreEditaVendaAction extends Action {

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
			ControleAcesso permissao = daoDao.verificaPermissao(usuario,seletor);

			if (usuario.getAdmin() == true || permissao.isEdita() == true)

			{

				String idPedido = (String) request.getParameter("id");

				Venda pedido = daoDao.loadPedido(Long.parseLong(idPedido));
				List<ProdutoVenda> produtoVenda = daoDao.listaProdutoVenda(pedido);
				
				List<Cliente> clientes = daoDao.listaClientes();
				List<Produto> produtos = daoDao.listaProdutos();
				List<FormaPagamento> listaFormaPagamento = daoDao.listaFormaPagamento();
				
				httpSession.setAttribute("listaClientes", clientes);
				httpSession.setAttribute("listaFormaPagamento", listaFormaPagamento);
				httpSession.setAttribute("produtos", produtos);
				httpSession.setAttribute("pedido", pedido);
				httpSession.setAttribute("client", pedido.getCliente());
				httpSession.setAttribute("formaPagamento", pedido.getFormaPagamento());
				httpSession.setAttribute("produtoVenda", produtoVenda);
				
				httpSession.setAttribute("currentPage", "/edita-pedido.jsp");
			}
			
			else{
				retorno = "negado";
			}
		}

		return mapping.findForward(retorno);
	}
}