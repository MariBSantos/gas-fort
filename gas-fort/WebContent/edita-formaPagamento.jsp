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

		<div id="titulo">Edição de Formas de Pagamento</div>

		<html:form action="/editaFormaPagamento" focus="descricao">

			<div id="formulario">
				<table>

					<html:hidden property="id" value="${formaPagamento.id}" />
					
					<tr>
						<td>Descrição</td>
						<td><html:text property="descricaoForma" styleClass="cadastro-text" maxlength="100" value="${formaPagamento.descricaoForma}" />
						</td>
					</tr>
					
					<tr height="40px">
						<td>Forma</td>
						<td><html:select property="forma" styleId="forma" value="${formaPagamento.forma.id}" styleClass="combo-box">
								<html:options collection="formas" property="id" labelProperty="descricao" />
							</html:select>
						</td>
					</tr>
					
					<tr>
						<td>Parcelas</td>
						<td><html:text property="parcelas" styleClass="cadastro-text" maxlength="11" value="${formaPagamento.parcelas}" />
						</td>
					</tr>

				</table>
			</div>
	
		<div id="botoes">
			<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right"></html:submit>
			<input type="button" class="botao-cancelar" style="float: right" value="Cancelar" onclick="javascript:document.location.href='lista-formasPagamento.jsp;' ">
		</div>	
		</html:form>

	</div>

</body>
</html>