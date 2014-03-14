package br.com.academus.gasfort.action;

import java.util.Calendar;
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
import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.ControleAcesso;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.RegistroAuditoria;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class DeletarClienteAction extends Action {

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
			Menu seletor = daoDao.loadMenu(Long.parseLong(menu));
			ControleAcesso permissao = new DAODao(session).verificaPermissao(usuario, seletor);

			if (usuario.getAdmin() == true || permissao.isDeleta() == true)

			{

				String idCliente = request.getParameter("id");
				Cliente cliente = daoDao.loadCliente(Long.parseLong(idCliente));

				daoDao.deleta(cliente);
				
				List<Endereco> enderecos = daoDao.buscaEndereco(cliente);
				
				for (Endereco endereco : enderecos) {
					
					Endereco enderec = daoDao.loadEndereco(endereco.getId());
					daoDao.deleta(enderec);
				}
				
				Boolean deletaCliente = daoDao.verificaCliente(Long.parseLong(idCliente));
				httpSession.setAttribute("deletaCliente", deletaCliente);
				
				RegistroAuditoria registroAuditoria = new RegistroAuditoria();
				
				Acao acao = daoDao.loadAcao(Long.parseLong("3"));
				
				registroAuditoria.setUsuario(usuario);
				registroAuditoria.setMenu(seletor);
				registroAuditoria.setAcao(acao);
				registroAuditoria.setData(Calendar.getInstance().getTime());
				
				daoDao.salva(registroAuditoria);

			}
			
			else{
				retorno = "negado";
			}
		}
		return mapping.findForward(retorno);
	}
}