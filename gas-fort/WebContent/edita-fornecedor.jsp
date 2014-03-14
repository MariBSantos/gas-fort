<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/arc-admin.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

</head>

<script type="text/javascript">

	function formatar(src, mask){
	var i = src.value.length;
    var saida = mask.substring(0,1);
	var texto = mask.substring(i)
	if (texto.substring(0,1) != saida)
	  {
	    src.value += texto.substring(0,1);
	 		}
	};
	
</script>

<body>

	<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="0" />
		</c:import>
	</div>

	<div id="conteudo">

		<div id="titulo">Edição de Fornecedor</div>

		<div id="conteudo-edicao">

			<html:form action="/editaFornecedor" focus="nomeFantasia">

				<div id="formulario-menor">

					<table style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px;">
					
					<html:hidden property="id" value="${fornecedor.id}" />

						<tr>
							<td>Nome Fantasia</td>
							<td><html:text property="nomeFantasia" styleClass="cadastro-text" maxlength="100" value="${fornecedor.nomeFantasia}" /></td>
						</tr>

						<tr>
							<td>Razão Social</td>
							<td><html:text property="razaoSocial" styleClass="cadastro-text" maxlength="100" value="${fornecedor.razaoSocial}" /></td>
							<td><html:errors property="razaoSocial"></html:errors></td>
						</tr>

						<tr>
							<td>CNPJ</td>
							<td><html:text property="cnpj" styleClass="cadastro-text" onkeypress="formatar(this, '##.###.###/####-##')" maxlength="18" value="${fornecedor.cnpj}" /></td>
							<td><html:errors property="cnpj"></html:errors></td>
						</tr>

						<tr>
							<td>IE</td>
							<td><html:text property="ie" styleClass="cadastro-text" maxlength="45" value="${fornecedor.ie}" /></td>
						</tr>
						
						<tr>
							<td>Endereço</td>
							<td><html:text property="endereco" styleClass="cadastro-text" maxlength="100" value="${fornecedor.endereco}" /></td>
						</tr>
						
						<tr>
							<td>Bairro</td>
							<td><html:text property="bairro" styleClass="cadastro-text" maxlength="45" value="${fornecedor.bairro}" /></td>
						</tr>
						
						<tr>
							<td>Cidade</td>
							<td><html:text property="cidade" styleClass="cadastro-text" maxlength="45" value="${fornecedor.cidade}" /></td>
						</tr>
						
						<tr>
							<td>CEP</td>
							<td><html:text property="cep" styleClass="cadastro-text" maxlength="45" value="${fornecedor.cep}" /></td>
						</tr>
						
						<tr>
							<td>Estado</td>
							<td><html:select property="estado" value="${fornecedor.estado.id }" styleClass="combo-box" styleId="indice-seletor">
									<html:options collection="estados" property="id" labelProperty="nome" />
								</html:select></td>
							<td><html:errors property="estado"></html:errors></td>
						</tr>
						
						<tr>
							<td>Telefone </td>
							<td><html:text property="telefone1" styleClass="cadastro-text" onkeypress="formatar(this, '##-####-####')" maxlength="20" value="${fornecedor.telefone1}"></html:text></td>
						</tr>
					
						<tr>
							<td>Telefone 2 </td>
							<td><html:text property="telefone2" styleClass="cadastro-text" onkeypress="formatar(this, '##-####-####')" maxlength="20" value="${fornecedor.telefone2}"></html:text></td>
						</tr>
					
						<tr>
							<td>Celular </td>
							<td><html:text property="celular" styleClass="cadastro-text" onkeypress="formatar(this, '##-#####-####')" maxlength="20" value="${fornecedor.celular}"></html:text></td>
						</tr>

					</table>
				</div>
				<div id="botoes">
					<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right;"></html:submit>
					<input type="button" class="botao-cancelar" style="float: right" value="Cancelar" onclick="javascript:document.location.href='lista-clientes.jsp;' ">
				</div>


			</html:form>

		</div>

	</div>

</body>
</html>