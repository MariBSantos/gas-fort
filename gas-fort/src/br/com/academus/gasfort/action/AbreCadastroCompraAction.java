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
import br.com.academus.gasfort.modelo.ControleAcesso;
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.modelo.Fornecedor;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.ProdutoCompra;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class AbreCadastroCompraAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";
		String menu = "7";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		Usuario usuario = (Usuario) httpSession.getAttribute("user");
		
		httpSession.removeAttribute("forn");
		httpSession.removeAttribute("formas");
		httpSession.removeAttribute("produtosCompra");

		if (usuario == null) {
			retorno = "expirado";
		} else {

			DAODao daoDao = new DAODao(session);
			Menu seletor = daoDao.loadMenu(Long.parseLong(menu));
			ControleAcesso permissao = daoDao.verificaPermissao(usuario, seletor);

			if (usuario.getAdmin() == true || permissao.isCria() == true)

			{

				List<Fornecedor> fornecedores = daoDao.listaFornecedores();
				List<Produto> produtos = daoDao.listaProdutos();
				List<FormaPagamento> formas = daoDao.listaFormaPagamento();

				List<ProdutoCompra> produtoCompra = new ArrayList<ProdutoCompra>();

				httpSession.setAttribute("produtoCompra", produtoCompra);
				httpSession.setAttribute("fornecedores", fornecedores);
				httpSession.setAttribute("produtos", produtos);
				httpSession.setAttribute("formas", formas);
				
				httpSession.setAttribute("currentPage", "/cadastro-compra.jsp");
			}
		}

		return mapping.findForward(retorno);
	}
}