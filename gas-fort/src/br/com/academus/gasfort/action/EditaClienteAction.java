package br.com.academus.gasfort.action;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.form.ClienteForm;
import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.RegistroAuditoria;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class EditaClienteAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";
		
		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();

		ClienteForm formulario = (ClienteForm) form;
		DAODao daoDao = new DAODao(session);
		Cliente clienteAtual = daoDao.loadCliente(formulario.getId());

		clienteAtual.setTipoCadastro(formulario.getTipoCadastro());
		clienteAtual.setNomeFantasia(formulario.getNomeFantasia());
		clienteAtual.setRazaoSocial(formulario.getRazaoSocial());
		
		if (formulario.getTipoCadastro() == 1)
		{
			clienteAtual.setCpf(formulario.getCpf());
			clienteAtual.setRg(formulario.getRg());
			clienteAtual.setCnpj(null);
			clienteAtual.setIe(null);
		}
		
		else{
			clienteAtual.setCpf(null);
			clienteAtual.setRg(null);
			clienteAtual.setCnpj(formulario.getCnpj());
			clienteAtual.setIe(formulario.getIe());
			
		};
		
		clienteAtual.setTelefone1(formulario.getTelefone1());
		clienteAtual.setTelefone2(formulario.getTelefone2());
		clienteAtual.setCelular(formulario.getCelular());

		daoDao.atualiza(clienteAtual);
		
		RegistroAuditoria registroAuditoria = new RegistroAuditoria();
		
		Usuario usuario = (Usuario) httpSession.getAttribute("user");
		Menu menu = daoDao.loadMenu(Long.parseLong("1"));
		Acao acao = daoDao.loadAcao(Long.parseLong("2"));
		
		registroAuditoria.setUsuario(usuario);
		registroAuditoria.setMenu(menu);
		registroAuditoria.setAcao(acao);
		registroAuditoria.setData(Calendar.getInstance().getTime());
		
		daoDao.salva(registroAuditoria);

		session.close();

		return mapping.findForward(retorno);
	}
}