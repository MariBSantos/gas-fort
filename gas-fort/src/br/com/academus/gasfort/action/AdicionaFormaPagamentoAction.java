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
import br.com.academus.gasfort.form.FormaPagamentoForm;
import br.com.academus.gasfort.modelo.Acao;
import br.com.academus.gasfort.modelo.Forma;
import br.com.academus.gasfort.modelo.FormaPagamento;
import br.com.academus.gasfort.modelo.Menu;
import br.com.academus.gasfort.modelo.RegistroAuditoria;
import br.com.academus.gasfort.modelo.Usuario;
import br.com.academus.gasfort.util.HibernateUtil;

public class AdicionaFormaPagamentoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String retorno = "ok";

		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		FormaPagamentoForm formulario = (FormaPagamentoForm) form;
		FormaPagamento formaPagamentoAtual = new FormaPagamento();

		formaPagamentoAtual.setDescricaoForma(formulario.getDescricaoForma());

		Forma forma = daoDao.loadForma(formulario.getForma());
		formaPagamentoAtual.setForma(forma);
		
		formaPagamentoAtual.setParcelas(Integer.parseInt(formulario.getParcelas()));

		daoDao.salva(formaPagamentoAtual);
		
		RegistroAuditoria registroAuditoria = new RegistroAuditoria();
		
		Usuario usuario = (Usuario) httpSession.getAttribute("user");
		Menu menu = daoDao.loadMenu(Long.parseLong("2"));
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