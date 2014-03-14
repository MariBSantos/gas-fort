<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Metroval's Intranet - Painel de Controle</title>
<link rel="shortcut icon" href="imgs/metro.ico" />
<link type="text/css" href="css/intranet.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>

</head>
<body>

<c:import url="cabecalho.jsp"></c:import>

<div id="menu lateral">
	<c:import url="principal.jsp">
		<c:param name="menu" value="0" />
	</c:import>
</div>	
		<div id="conteudo">
			
			<div id="titulo">Formas de Pagamento</div>
			
			<html:form action="/adicionaFormaPagamento" focus="descricao">
			
			<div id="formulario">
			<table>
					<tr>
						<td>Descrição</td>
						<td><html:text property="descricaoForma" styleClass="cadastro-text" maxlength="100"></html:text></td>
						<td><html:errors property="descricaoForma"></html:errors></td>
					</tr>
					
					<tr>
						<td>Forma</td>
							<td><html:select property="forma" styleClass="combo-box" styleId="indice-seletor">
									<html:option value="0">Selecione</html:option>
									<html:options collection="formas" property="id" labelProperty="descricao" />
								</html:select></td>
								<td><html:errors property="forma"></html:errors></td>
						</tr>
					
					<tr>
						<td>Parcelas</td>
						<td><html:text property="parcelas" styleClass="cadastro-text" maxlength="11"></html:text></td>
					</tr>
					
			</table>
			</div>
		
			<div id="botoes">
				<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right"></html:submit>
				<input type="button" class="botao-cancelar"  style="float: right" value="Cancelar" onclick="javascript:document.location.href='lista-formasPagamento.jsp;' ">
			</div>

			</html:form>
		</div>
	
</body>
</html>