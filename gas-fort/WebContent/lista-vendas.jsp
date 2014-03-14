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

<link type="text/css" href="css/arc-admin.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css"	rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript">
$(function(){			
	$( "#datepicker" ).datepicker(
		{ dateFormat: "dd/mm/yy" }
	);
	$("#dialog-confirm").hide();
	$("#dialog-confirm-2").hide();
	$("#paginacao").hide();
	var confirmacao = "${deletaProduto}";
	if (confirmacao == "false"){
		$("#dialog-confirm-2").dialog()
	}
	
	$(".noEnterSubmit").keypress(function(e) {
		if (e.which == 13) { e.preventDefault(); }
		});
	
	var pagina ="${local}";
	if(pagina == "1"){
		$("#paginacao").show();
	}
	
	
});		

function deletar(id) { 			
	$("#dialog:ui-dialog").dialog("destroy");	
	$("#dialog-confirm").dialog({
		resizable: false,
		height: 210,
		modal: true,
		buttons: {
			"Deletar": function() {
				document.location.href="/gas-fort/deletarVenda.do?id=" + id;
				$(this).dialog("close");
			},
			Cancelar: function() {
				$(this).dialog("close");
			}}})};
			
			function anterior(pg){
				var indice = $('#indice-seletor').val();
				var valor = $('#valor').val();
				
				if (indice == 1)
					{
					document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
				
					}
				
				if (indice == 2)
					{
					var valorCombo = $('#combo-select').val();
					valor = valorCombo;
					
					document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
					
					}
				
				if (indice == 3)
				{
					var valorCombo = $('#datepicker').val();
					valor = valorCombo;
					
					document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
					
					}
			};
			
			function proxima(pg){
				var indice = $('#indice-seletor').val();
				var valor = $('#valor').val();
				
				if (indice == 1)
				{
				document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
			
				}
				
				if (indice == 2)
					{
					var valorCombo = $('#combo-select').val();
					valor = valorCombo;
					
					document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
					
					}
				
				if (indice == 3)
				{
					var valorCombo = $('#datepicker').val();
					valor = valorCombo;
					
					document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
					
					}
			};
			
			function busca(pg){
				var indice = $('#indice-seletor').val();
				var valor = $('#valor').val();
				
				if (indice == 1)
				{
				document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
			
				}
				
				if (indice == 2)
					{
					var valorCombo = $('#cliente').val();
					valor = valorCombo;
					
					document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
					
					}
				
				if (indice == 3)
				{
					var valorCombo = $('#datepicker').val();
					valor = valorCombo;
					
					document.location.href='/gas-fort/buscaVenda.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
					
					}
			};
			
			function formatar(src, mask){
				  var i = src.value.length;
				  var saida = mask.substring(0,1);
				  var texto = mask.substring(i)
				if (texto.substring(0,1) != saida)
				  {
				    src.value += texto.substring(0,1);
				  }
				};
			
			$(document).ready(function() {
				$('#combo-select').css('display','none');
				$('#indice-seletor').change(function() {
					$('#combo-select').hide();
					$('#valor-busca').show();
					$('#data-busca').hide();
					
					if ($('#indice-seletor').val() == "2"){
						$('#combo-select').show();
						$('#valor-busca').hide();
						$('#data-busca').hide();
						$('#valor').val('');
						$('#datepicker').val('');
						
					}
					
					else if ($('#indice-seletor').val() == "3"){
						$('#combo-select').hide();
						$('#valor-busca').hide();
						$('#data-busca').show();
						$('#valor').val('');
						$('#cliente').val(-1);
					}
					else{      
						$('#combo-select').hide();
						$('#label-busca').show();
						$('#data-busca').hide();
						
					}
				});
				$('#indice-seletor').change();
			});
	
</script>

</head>
<body>

<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="2" />
		</c:import>
	</div>

	<div id="dialog-confirm" title="Deletar pedido?">
		<p>
			<span style="float: left; margin: 0 20px 20px 0;"><img
				src="imgs/error.png" /></span> Tem certeza que deseja remover esse Pedido?
		</p>
	</div>

	<div id="dialog-confirm-2" title="Alerta" style="font: 12px verdana;">
		<p>
			<span style="float: left; margin: 0 20px 20px 0;"><img
				src="imgs/error.png" />Este cadastro não pode ser excluído!</span>
		</p>
	</div>

	<div id="conteudo">

		<div id="titulo">Pedidos</div>

		<div id="busca">
			<html:form action="/buscaVenda" styleClass="noEnterSubmit" focus="valor">
				<div class="label-busca">Índice</div>
				<html:select property="indice" styleClass="combo-box-busca" styleId="indice-seletor">
					<html:option value="1">Código</html:option>
					<html:option value="2">Cliente</html:option>
					<html:option value="3">Data de Emissão</html:option>
				</html:select>

				<div id="valor-busca">
					<div class="label-busca">Valor</div>
					<html:text property="valor" styleClass="caixa-texto-busca" styleId="valor" value="${valor}"></html:text>
				</div>
				
				<div id="data-busca">
					<div class="label-busca">Valor</div>
					<html:text property="valor" styleClass="caixa-texto-busca" styleId="datepicker" value="${valor}" onkeypress="formatar(this, '##/##/####')" maxlength="10"></html:text>
				</div>
				
				<div id="combo-select">
					<div class="label-busca">Valor</div>
						<html:select styleId="cliente" property="valorCombo" styleClass="combo-box-busca" value="${valor}">
						<html:option value="-1">Selecione</html:option>
						<html:options collection="clientes" property="id" labelProperty="nomeFantasia" />
					</html:select>
				</div>
				
				<html:hidden property="indice" />
				<html:hidden property="valor" />

				<input type="button" class="botao-busca" value="Buscar" onclick="javascript:busca(0)">
				<input type="button" class="botao-adicionar" value="Adicionar" onclick="document.location.href='abreCadastroVenda.do'" />

			</html:form>
		</div>
		
		<div id="conteudo-principal">

			<table id="tabela">

				<tr class="cabecalho-lista">
					<th>Código</th>
					<th>Cliente</th>
					<th>Data de Emissão</th>
					<th colspan="2">Opções</th>
				</tr>

				<c:choose>

					<c:when test="${empty pedidos}">
						<tr>
							<td colspan="5" style="color: gray; text-align: center;">Nenhum resultado encontrado!</td>
						</tr>
					</c:when>

					<c:otherwise>

						<c:forEach var="pedidos" items="${pedidos}">
							<tr>
								<td>${pedidos.id}</td>
								<td>${pedidos.cliente.nomeFantasia}</td>
								<td><fmt:formatDate value="${pedidos.data}" type="date" pattern="dd/MM/yyyy" /></td>

								<td colspan="2" align="center">
									<a href="abreEditaVenda.do?id=${pedidos.id}"> 
									<img src="imgs/edit.png" title="Editar" border="0" /></a> 
									<a href="#" onclick="javascript:deletar(${pedidos.id});"> 
								<img src="imgs/delete.png" title="Deletar" align="top" border="0" /></a></td>
							</tr>
						</c:forEach>

					</c:otherwise>

				</c:choose>
			</table>
			
			<div id="paginacao" align="center">
				<a href="#" onclick="javascript:anterior('${antPg}')"> Página Anterior</a> |&nbsp;${idxPg}&nbsp;| 
				<a href="#" onclick="javascript:proxima('${proxPg}')">Próxima Página</a>
			</div>
			
		</div>
	</div>

</body>
</html>