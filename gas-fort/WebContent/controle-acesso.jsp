
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/arc-admin.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.6.js'></script>

<link rel="stylesheet" type="text/css" href="/css/result-light.css">


<script type='text/javascript'>

function limpa(){
		var input = document.getElementsByTagName('input');
		
		for(var i=0; i<input.length; i++)
			switch (input[i].type){
				case 'checkbox' : input[i].checked= ''; break;				
			}
	};
	
	function marca(){
		var input = document.getElementsByTagName('input');
		
		for(var i=0; i<input.length; i++)
			switch (input[i].type){
				case 'checkbox' : input[i].checked= 'true'; break;				
			}
	};


</script>


</head>
<body>

	<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="0" />
		</c:import>
	</div>

	<div id="conteudo">

		<div id="titulo">Controle de Permissão de Usuário >> ${usuario.nome}</div>

		<html:form action="/controleAcesso">

			<div id="formulario">

				<html:hidden property="idUsuario" value="${idUsuario}" />

				<table id="tabela-acesso">

					<tr style="height: 20px;">
						<td style="background-color: #fff"></td>
						<td
							style="background-color: #c9c9c9; text-align: center; width: 150px;">Adiciona</td>
						<td
							style="background-color: #c9c9c9; text-align: center; width: 150px;">Edita</td>
						<td
							style="background-color: #c9c9c9; text-align: center; width: 150px;">Exclui</td>
						<td
							style="background-color: #c9c9c9; text-align: center; width: 150px;">Visualiza</td>
					</tr>

					<logic:iterate id="control" name="ControleAcessoForm" property="control">
						<tr>
							<td	style="background-color: #c9c9c9; text-align: center; width: 220px; padding-right: 20px;">
								<bean:write name="control" property="menu.descricao"></bean:write>
							</td>
							<td><html:checkbox property="cria" name="control" styleClass="marcar" indexed="true" /> 
								<html:hidden property="cria" name="control" indexed="true" value="false"/>
							</td>
							<td><html:checkbox property="edita" name="control" styleClass="marcar" indexed="true" /> 
								<html:hidden property="edita" name="control" indexed="true" value="false"/>
							</td>
							<td><html:checkbox property="deleta" name="control" styleClass="marcar" indexed="true" /> 
								<html:hidden property="deleta" name="control" indexed="true" value="false"/>
							</td>
							<td><html:checkbox property="visualiza" name="control" styleClass="marcar" indexed="true" /> 
							 	<html:hidden property="visualiza" name="control" indexed="true" value="false"/>
							</td>
						</tr>
					</logic:iterate>
					<tr>
						<td colspan="5" style="background-color: #fff">
							<input type="button" class="botao-verde" style="width: 120px; float:right;" onclick="javascript:marca();" value="Marcar Todos" />
							<input type="button" class="botao-cancelar" style="width: 120px; float:right;" onclick="javascript:limpa();" value="Desmarcar Todos" />
						</td>
					</tr>
				</table>
				
			</div>

			<div id="botoes">
				<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right"></html:submit>
				<input type="button" class="botao-cancelar" style="float: right" value="Cancelar" onclick="javascript:document.location.href='abreBuscaUsuario.do;' ">
			</div>

		</html:form>

	</div>

</body>
</html>