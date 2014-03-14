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

		<div id="titulo">Edição de Produtos</div>

		<html:form action="/editaProduto" focus="descricao">

			<div id="formulario">
				<table>

					<html:hidden property="id" value="${produto.id}" />
					
					<tr>
						<td>Código</td>
						<td><html:text property="id" styleClass="cadastro-text" maxlength="100" value="${produto.id}" disabled="true" />
						</td>
					</tr>
					
					<tr>
						<td>Descrição</td>
						<td><html:text property="descricao" styleClass="cadastro-text" maxlength="100" value="${produto.descricao}" />
						<td><html:errors property="descricao"></html:errors></td>
						</td>
					</tr>
					
					<tr>
						<td>Sigla</td>
						<td><html:text property="sigla" styleClass="cadastro-text" maxlength="11" value="${produto.sigla}" />
						</td>
					</tr>
					
					<tr>
						<td>Volume</td>
						<td><html:text property="volume" styleClass="cadastro-text" maxlength="11" value="${produto.volume}" />
						</td>
					</tr>

					<tr>
						<td>Valor</td>
						<td><html:text property="valor" styleClass="cadastro-text" maxlength="11" value="${produto.valor}" />
						<td><html:errors property="valor"></html:errors></td>
						</td>
					</tr>
				
				</table>
			</div>
	
		<div id="botoes">
			<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right"></html:submit>
			<input type="button" class="botao-cancelar" style="float: right" value="Cancelar" onclick="javascript:document.location.href='lista-produtos.jsp;' ">
		</div>	
		</html:form>

	</div>

</body>
</html>