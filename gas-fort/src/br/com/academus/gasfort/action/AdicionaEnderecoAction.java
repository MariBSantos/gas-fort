package br.com.academus.gasfort.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.form.EnderecoForm;
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.modelo.Estado;
import br.com.academus.gasfort.util.HibernateUtil;

public class AdicionaEnderecoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {


		HttpSession httpSession = request.getSession();
		Session session = new HibernateUtil().getSession();
		String currentPage = (String) httpSession.getAttribute("currentPage");

		EnderecoForm formulario = (EnderecoForm) form;
		DAODao daoDao = new DAODao(session);

		Endereco enderecoAtual = new Endereco();

		Cliente cliente = daoDao.loadCliente(formulario.getCliente());
		enderecoAtual.setCliente(cliente);
		
		enderecoAtual.setTipoEndereco(formulario.getTipoEndereco());
		enderecoAtual.setEndereco(formulario.getEndereco());
		enderecoAtual.setBairro(formulario.getBairro());
		enderecoAtual.setCidade(formulario.getCidade());
		enderecoAtual.setCep(formulario.getCep());
		
		Estado estado = daoDao.loadEstado(formulario.getEstado());
		enderecoAtual.setEstado(estado);

		daoDao.salva(enderecoAtual);
		
		return new ActionForward(currentPage, true);

	}
}