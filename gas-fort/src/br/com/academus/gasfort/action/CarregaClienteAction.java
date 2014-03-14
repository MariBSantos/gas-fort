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
import br.com.academus.gasfort.modelo.Cliente;
import br.com.academus.gasfort.modelo.Endereco;
import br.com.academus.gasfort.util.HibernateUtil;

public class CarregaClienteAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		String idCliente = request.getParameter("cliente");

		Session session = new HibernateUtil().getSession();
		DAODao daoDao = new DAODao(session);

		Cliente client = daoDao.loadCliente(Long.parseLong(idCliente));
		Endereco endereco = daoDao.loadEndereco(client);		
		JSONObject object = new JSONObject();

		object.put("id", client.getId());
		object.put("nomeFantasia", client.getNomeFantasia());
		object.put("razaoSocial", client.getRazaoSocial());
		object.put("tipoCadastro", client.getTipoCadastro());
		object.put("cpf", client.getCpf());
		object.put("rg", client.getRg());
		object.put("cnpj", client.getCnpj());
		object.put("ie", client.getIe());
		object.put("telefone1", client.getTelefone1());
		object.put("celular", client.getCelular());
		
		if (endereco != null){
			object.put("endereco", endereco.getEndereco());
			object.put("bairro", endereco.getBairro());
			object.put("cidade", endereco.getCidade());
		}
		
		

		String jsonResult = object.toString();

		response.setContentType("text/javascript; charset=utf-8");
		response.getWriter().write(jsonResult);
		
		httpSession.setAttribute("client", client);

		return null;
	}

}