<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		$( "#datepicker1" ).datepicker(
				{ dateFormat: "dd/mm/yy" }
			);
		$( "#datepicker2" ).datepicker(
				{ dateFormat: "dd/mm/yy" }
			);
		$("#paginacao").hide();
		
		$(".noEnterSubmit").keypress(function(e) {
			if (e.which == 13) { e.preventDefault(); }
			});

		var pagina ="${local}";
		if(pagina == "1"){
			$("#paginacao").show();
		}
	});		

	function anterior(pg){
		var indice = $('#indice-seletor').val();
		var valor = $('#valor').val();
			document.location.href='/arc-admin/buscaClientes.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
	};
	
	function proxima(pg){
		var indice = $('#indice-seletor').val();
		var valor = $('#valor').val();
			document.location.href='/arc-admin/buscaClientes.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
	};
	
	$(document).ready(function() {
		$('#indice-seletor').change(function() {
				$('#valor').val('')
			})});	
	</script>

</head>
<body>

<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="3" />
		</c:import>
	</div>

	<div id="conteudo">

		<div id="titulo">Saldo em Estoque</div>

		<div id="busca">
			<html:form action="/buscaEstoque" styleClass="noEnterSubmit" focus="valor">

				<div id="label-busca">
					<div class="label-busca">Período</div>
					<html:text property="dataInicial" styleClass="caixa-texto-busca" styleId="datepicker1" value="${dataInicial}" onkeypress="formatar(this, '##/##/####')" maxlength="10"></html:text>
					<html:text property="dataFinal" styleClass="caixa-texto-busca" styleId="datepicker2" value="${dataFinal}" onkeypress="formatar(this, '##/##/####')" maxlength="10"></html:text>
				</div>

				<html:hidden property="valor" />
				<html:hidden property="pg" value="0" />
				<html:submit styleClass="botao-busca" value="Buscar" />
			</html:form>
		</div>

		<div id="conteudo-principal">

			<table id="tabela">

				<tr class="cabecalho-lista">
					<th colspan="2">Produto</th>
					<th colspan="2">Saldo</th>
				</tr>

				<c:choose>

					<c:when test="${empty auditoria}">
						<tr>
							<td colspan="19" style="color: gray; text-align: center;">Nenhum resultado encontrado!</td>
						</tr>
					</c:when>

					<c:otherwise>

						<c:forEach var="auditoria" items="${auditoria}">
							<tr>
								<td colspan="2">${auditoria.usuario.nome}</td>
								<td colspan="2">${auditoria.menu.descricao}</td>
								<td colspan="2">${auditoria.acao.descricao}</td>
								<td><fmt:formatDate value="${auditoria.data}" type="date" pattern="dd/MM/yyyy" /></td>

							</tr>
						</c:forEach>

					</c:otherwise>

				</c:choose>
			</table>
			
			<div id="paginacao" align="center">
				<a href="#" onclick="javascript:anterior('${antPg}')"> Página anterior</a> 
				|&nbsp;${idxPg}&nbsp;| 
				<a href="#"	onclick="javascript:proxima('${proxPg}')">Próxima Página</a>
			</div>
			
		</div>

	</div>

</body>
</html>