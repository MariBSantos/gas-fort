<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>LinQgaz</title>
	<link rel="shortcut icon" href="imgs/metro.ico" />
	
	<link type="text/css" href="css/gas-fort.css" rel="stylesheet"/>
	
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
			
			<div id="titulo">Empresa</div>
			
			<div id="conteudo-edicao">
			
			<div id="formulario-menor">
			
			<table style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px;">
					<tr>
						<td>Nome Fantasia</td>
						<td><html:text property="nomeFantasia" styleClass="cadastro-text" maxlength="100" value="${empresa.nomeFantasia}" disabled="true"/></td>
					</tr>

					<tr>
						<td>Razão Social</td>
						<td><html:text property="razaoSocial" styleClass="cadastro-text" maxlength="100" value="${empresa.razaoSocial}" disabled="true" /></td>
					</tr>
					
					<tr>
						<td>CNPJ</td>
						<td><html:text property="cnpj" styleClass="cadastro-text" maxlength="50" value="${empresa.cnpj}" disabled="true" /></td>
						<td><html:errors property="cnpj" /></td>
					</tr>
					
					<tr>
						<td>IE</td>
						<td><html:text property="ie" styleClass="cadastro-text" maxlength="45" value="${empresa.ie}" disabled="true" /></td>
						<td><html:errors property="ie" /></td>
					</tr>

					<tr>
						<td>Endereço</td>
						<td><html:text property="endereco" styleClass="cadastro-text" maxlength="100" value="${empresa.endereco}" disabled="true" /></td>
					</tr>
					
					<tr>
						<tr>
						<td>Bairro</td>
						<td><html:text property="bairro" styleClass="cadastro-text" maxlength="45" value="${empresa.bairro}" disabled="true" /></td>
					</tr>
					
					<tr>
						<tr>
						<td>Cidade</td>
						<td><html:text property="cidade" styleClass="cadastro-text" maxlength="45" value="${empresa.cidade}" disabled="true" /></td>
					</tr>
					
					<tr>
						<tr>
						<td>CEP</td>
						<td><html:text property="cep" styleClass="cadastro-text" maxlength="45" value="${empresa.cep}" disabled="true" /></td>
					</tr>
					
					<tr>
						<tr>
						<td>Estado</td>
						<td><html:text property="estado" styleClass="cadastro-text" maxlength="45" value="${empresa.estado.nome}" disabled="true" /></td>
					</tr>
					
			</table>
			</div>
		
		<div id="botoes">
			<input type="button" class="botao-adicionar"  style="float: right" value="Editar" onclick="javascript:document.location.href='abreEditaEmpresa.do;' ">
			<input type="button" class="botao-cancelar"  style="float: right" value="Cancelar" onclick="javascript:document.location.href='menu-principal.jsp;' ">
		</div>
		
		</div>
	</div>
	
</body>
</html>