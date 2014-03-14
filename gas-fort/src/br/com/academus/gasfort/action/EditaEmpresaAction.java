package br.com.academus.gasfort.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.form.EmpresaForm;
import br.com.academus.gasfort.modelo.Empresa;
import br.com.academus.gasfort.modelo.Estado;
import br.com.academus.gasfort.util.HibernateUtil;

public class EditaEmpresaAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Session session = new HibernateUtil().getSession();

		String retorno = "ok";

		EmpresaForm formulario = (EmpresaForm) form;
		DAODao daoDao = new DAODao(session);
		Empresa empresaAtual = daoDao.loadEmpresa(Long.parseLong("1"));

		empresaAtual.setNomeFantasia(formulario.getNomeFantasia());
		empresaAtual.setRazaoSocial(formulario.getRazaoSocial());
		empresaAtual.setCnpj(formulario.getCnpj());
		empresaAtual.setIe(formulario.getIe());
		empresaAtual.setEndereco(formulario.getEndereco());
		empresaAtual.setBairro(formulario.getBairro());
		empresaAtual.setCidade(formulario.getCidade());
		empresaAtual.setCep(formulario.getCep());
		
		Estado estado = daoDao.loadEstado(formulario.getEstado());
		empresaAtual.setEstado(estado);

		daoDao.atualiza(empresaAtual);

		session.close();

		return mapping.findForward(retorno);
	}
}