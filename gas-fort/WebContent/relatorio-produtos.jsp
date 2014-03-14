<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" media="" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
<link type="text/css" href="css/print.css" rel="stylesheet" media="print" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){			
		$("#dialog-confirm").hide();
		$("#dialog-confirm-2").hide();
		$('.mostrarCodigo').hide();
		$('.mostrarDescricao').hide();
		$('.mostrarSigla').hide();
		$("#paginacao").hide();
		var confirmacao = "${deletaProduto}";
		if (confirmacao == "false"){
			$("#dialog-confirm-2").dialog();
		}
		
		$(".noEnterSubmit").keypress(function(e) {
			if (e.which == 13) { e.preventDefault(); }
			});
		
		var pagina ="${local}";
		if(pagina == "1"){
			$("#paginacao").show();
			};
		
		var indice = ($('#indice-seletor').val());
		if (indice == 0)
			{
				$('.mostrarCodigo').show();
			};
		if (indice == 1)
			{
				$('.mostrarDescricao').show();
			};
		
		if (indice == 2)
			{
				$('.mostrarSigla').show();
			}
			});		

			function anterior(pg){
				var valor = $('#valor').val();
					document.location.href='/gas-fort/buscaProduto.do?valor=' + valor + "&pg=" + pg;
			};
			
			function proxima(pg){
				var valor = $('#valor').val();
					document.location.href='/gas-fort/buscaProduto.do?valor=' + valor + "&pg=" + pg;
			};
			
			$(document).ready(function() {
				$('#indice-seletor').change(function() {
						$('#valor').val('');
					});
				});
			
			function imprimir(){
				document.getElementById('conteudo').style.left = '0px';
				document.getElementById('conteudo').style.top = '30px';
				document.getElementById('conteudo').style.position = 'absolute';
				document.getElementById('conteudo').style.border = 'none';
				document.getElementById('conteudo-principal').style.left = '0px';
				document.getElementById('conteudo-principal').style.top = '50px';
				document.getElementById('conteudo-principal').style.position = 'absolute';
				document.getElementById('paginacao').style.display = 'none';
				
				
				window.print();
				
				document.getElementById('conteudo').style.left = '25%';
				document.getElementById('conteudo').style.top = '100px';
				document.getElementById('conteudo').style.position = 'fixed';
				document.getElementById('conteudo-principal').style.left = '25%';
				document.getElementById('conteudo-principal').style.top = '242px';
				document.getElementById('conteudo-principal').style.position = 'fixed';
				document.getElementById('paginacao').style.display = 'block';
			};
			
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

		<div id="titulo">Produtos</div>
		
		<div id="busca">
			<html:form action="/relatorioProduto" styleClass="noEnterSubmit" focus="valor">
				<div class="label-busca">Índice</div>
				<html:select property="indice" styleClass="combo-box-busca" styleId="indice-seletor">
					<html:option value="0">Código</html:option>
					<html:option value="1">Nome</html:option>
					<html:option value="2">Sigla</html:option>
				</html:select>

				<div id="label-busca">
					<div class="label-busca">Valor</div>
					<html:text property="valor" styleClass="caixa-texto-busca" styleId="valor"></html:text>
				</div>

				<html:hidden property="indice" />
				<html:hidden property="valor" />
				<html:hidden property="pg" value="0" />
				<html:hidden property="buscaPedido" value="0" />

				<html:submit styleClass="botao-busca" value="Buscar" />
				<input type="button" class="botao-busca" onclick="javascript: imprimir()" value="Imprimir" />
				
			</html:form>
		</div>
		
		<div id="conteudo-principal">

			<table id="tabela">

				<c:choose>

					<c:when test="${empty produtos}">
						<tr>
							<td colspan="6" style="color: gray; text-align: center;">Nenhum resultado encontrado!</td>
						</tr>
					</c:when>

					<c:otherwise>

					<c:forEach var="produtos" items="${produtos}">
						<tr id="cabecalho-lista" class="mostrarCodigo">
							<th>${produtos.id}</th>
						</tr>
						
						<tr id="cabecalho-lista" class="mostrarDescricao">
							<th>${produtos.descricao}</th>
						</tr>
						
						<tr id="cabecalho-lista" class="mostrarSigla">
							<th>${produtos.sigla}</th>
						</tr>
						
						<tr style="height: 25px;">
							<td style="border-bottom-style: none;"><b>Produto:</b> ${produtos.descricao}</td>
						</tr>
						
						<tr style="height: 25px;">
							<td style="border-bottom-style: none;"><b>Sigla:</b> ${produtos.sigla}</td>
						</tr>
						<tr style="height: 25px;">
							<td ><b>Valor:</b> ${produtos.volume}</td>
						</tr>
						<tr style="height: 10px;">
							<td style="border-bottom-style: none;"></td>
						</tr>
					</c:forEach>

					</c:otherwise>

				</c:choose>
			</table>
			
			<div id="paginacao" align="center">
				<a href="#" onclick="javascript:anterior('${antPg}')"> Página Anterior</a> |&nbsp;${idxPg}&nbsp;| <a href="#"
					onclick="javascript:proxima('${proxPg}')">Próxima Página</a>
			</div>
			
		</div>
		
	</div>
	
</body>
</html>