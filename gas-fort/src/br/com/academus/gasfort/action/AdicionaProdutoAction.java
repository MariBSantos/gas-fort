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
import br.com.academus.gasfort.form.ProdutoForm;
import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.Produto;
import br.com.academus.gasfort.modelo.RegistroAuditoria;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class AdicionaProdutoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();

		ProdutoForm formulario = (ProdutoForm) form;
		DAODao daoDao = new DAODao(session);

		Produto produtoAtual = new Produto();

		produtoAtual.setDescricao(formulario.getDescricao());
		produtoAtual.setSigla(formulario.getSigla());
		produtoAtual.setVolume(formulario.getVolume());
		produtoAtual.setValor(formulario.getValor());
		produtoAtual.setSaldo(formulario.getSaldo());

		daoDao.salva(produtoAtual);
		
		RegistroAuditoria registroAuditoria = new RegistroAuditoria();
		
		Usuario usuario = (Usuario) httpSession.getAttribute("user");
		Menu menu = daoDao.loadMenu(Long.parseLong("4"));
		Acao acao = daoDao.loadAcao(Long.parseLong("1"));
		
		registroAuditoria.setUsuario(usuario);
		registroAuditoria.setMenu(menu);
		registroAuditoria.setAcao(acao);
		registroAuditoria.setData(Calendar.getInstance().getTime());
		
		daoDao.salva(registroAuditoria);

		return mapping.findForward(retorno);

	}
}