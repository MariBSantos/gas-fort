<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>

</head>
<body>

	<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="0" />
		</c:import>
	</div>

	<div id="conteudo">

		<div id="titulo">Edição de Usuário</div>

		<html:form action="/editaUsuario" focus="descricao">

			<div id="formulario">
				<table>

					<html:hidden property="id" value="${usuario.id}" />

					<tr>
						<td>Nome</td>
						<td><html:text property="nome" styleClass="cadastro-text" maxlength="100" value="${usuario.nome}" /></td>
						<td><html:errors property="nome"></html:errors></td>
					</tr>
					
					<tr>
						<td>E-mail</td>
						<td><html:text property="email" styleClass="cadastro-text" maxlength="11" value="${usuario.email}" /></td>
						<td><html:errors property="email"></html:errors></td>
					</tr>

					<tr>
						<td>Login</td>
						<td><html:text property="login" styleClass="cadastro-text" maxlength="11" value="${usuario.login}" /></td>
						<td><html:errors property="login"></html:errors></td>
					</tr>

					<tr>
						<td>Senha</td>
						<td><html:password property="senha" styleClass="cadastro-text" maxlength="11" value="${usuario.senha}" /></td>
						<td><html:errors property="senha"></html:errors></td>
					</tr>
					
					<tr>
						<td>Administrador</td>
						<td><html:select property="admin" value="${usuario.admin}" styleClass="combo-box">
							<html:option value="0">Selecione</html:option>
							<html:option value="true">Sim</html:option>
							<html:option value="false">Não</html:option>
							</html:select>
						</td>
					</tr>

				</table>
			</div>

			<div id="botoes">
				<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right"></html:submit>
				<input type="button" class="botao-cancelar" style="float: right" value="Cancelar" onclick="javascript:document.location.href='lista-usuarios.jsp;' ">
			</div>
		</html:form>

	</div>

</body>
</html>