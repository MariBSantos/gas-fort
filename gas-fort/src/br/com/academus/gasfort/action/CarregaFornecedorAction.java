package br.com.academus.gasfort.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.json.JSONObject;

import br.com.academus.gasfort.dao.DAODao;
import br.com.academus.gasfort.modelo.Fornecedor;
import br.com.academus.gasfort.util.HibernateUtil;

public class CarregaFornecedorAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		String idFornecedor = request.getParameter("fornecedor");

		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		Fornecedor forn = daoDao.loadFornecedor(Long.parseLong(idFornecedor));
		
		JSONObject object = new JSONObject();

		object.put("id", forn.getId());
		object.put("nomeFantasia", forn.getNomeFantasia());
		object.put("razaoSocial", forn.getRazaoSocial());
		object.put("cnpj", forn.getCnpj());
		object.put("ie", forn.getIe());
		object.put("endereco", forn.getEndereco());
		object.put("bairro", forn.getBairro());
		object.put("cidade", forn.getCidade());
		object.put("telefone1", forn.getTelefone1());
		object.put("celular", forn.getCelular());

		String jsonResult = object.toString();

		response.setContentType("text/javascript; charset=utf-8");
		response.getWriter().write(jsonResult);
		
		httpSession.setAttribute("forn", forn);

		return null;
	}

}