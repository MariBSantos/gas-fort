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
import br.com.academus.gasfort.form.FornecedorForm;
import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Estado;
import br.com.academus.gasfort.modelo.Fornecedor;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.RegistroAuditoria;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class AdicionaFornecedorAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();

		FornecedorForm formulario = (FornecedorForm) form;
		DAODao daoDao = new DAODao(session);

		Fornecedor fornecedorAtual = new Fornecedor();

		fornecedorAtual.setNomeFantasia(formulario.getNomeFantasia());
		fornecedorAtual.setRazaoSocial(formulario.getRazaoSocial());
		fornecedorAtual.setCnpj(formulario.getCnpj());
		fornecedorAtual.setIe(formulario.getIe());
		fornecedorAtual.setEndereco(formulario.getEndereco());
		fornecedorAtual.setBairro(formulario.getBairro());
		fornecedorAtual.setCidade(formulario.getCidade());
		fornecedorAtual.setCep(formulario.getCep());
		
		Estado estado = daoDao.loadEstado(formulario.getEstado());
		fornecedorAtual.setEstado(estado);
		
		fornecedorAtual.setTelefone1(formulario.getTelefone1());
		fornecedorAtual.setTelefone2(formulario.getTelefone2());
		fornecedorAtual.setCelular(formulario.getCelular());

		daoDao.salva(fornecedorAtual);
		
		RegistroAuditoria registroAuditoria = new RegistroAuditoria();
		
		Usuario usuario = (Usuario) httpSession.getAttribute("user");
		Menu menu = daoDao.loadMenu(Long.parseLong("3"));
		Acao acao = daoDao.loadAcao(Long.parseLong("1"));
		
		registroAuditoria.setUsuario(usuario);
		registroAuditoria.setMenu(menu);
		registroAuditoria.setAcao(acao);
		registroAuditoria.setData(Calendar.getInstance().getTime());
		
		daoDao.salva(registroAuditoria);

		session.close();

		return mapping.findForward(retorno);

	}
}