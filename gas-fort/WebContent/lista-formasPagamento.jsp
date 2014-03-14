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

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){			
		$("#dialog-confirm").hide();
		$("#dialog-confirm-2").hide();
		$("#paginacao").hide();
		var confirmacao = "${deletaCliente}";
		if (confirmacao == "false"){
			$("#dialog-confirm-2").dialog();
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
					document.location.href="/gas-fort/deletarFormaPagamento.do?id=" + id;
					$(this).dialog("close");
				},
				Cancelar: function() {
					$(this).dialog("close");
				}
			}
		});
	}
	
	function anterior(pg){
		var indice = $('#indice-seletor').val();
		var valor = $('#valor').val();
			document.location.href='/gas-fort/buscaFormaPagamento.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
	};
	
	function proxima(pg){
		var indice = $('#indice-seletor').val();
		var valor = $('#valor').val();
			document.location.href='/gas-fort/buscaFormaPagamento.do?indice=' + indice + "&valor=" + valor + "&pg=" + pg;
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

	<div id="dialog-confirm" title="Deletar Forma de Pagamento">
		<p>
			<span style="float: left; margin: 0 20px 20px 0;"><img
				src="imgs/error.png" /></span> Tem certeza que deseja remover essa Forma de Pagamento?
		</p>
	</div>

	<div id="dialog-confirm-2" title="Alerta" style="font: 12px verdana;">
		<p>
			<span style="float: left; margin: 0 20px 20px 0;"><img
				src="imgs/error.png" />Este cadastro não pode ser excluído! </span>
		</p>
	</div>

	<div id="conteudo">

		<div id="titulo">Formas de Pagamento</div>

		<div id="busca">
			<html:form action="/buscaFormaPagamento" styleClass="noEnterSubmit" focus="valor">
				<div class="label-busca">Busca por Nome</div>
				<html:text property="valor" styleId="valor" styleClass="caixa-texto-busca"></html:text>
					
					<html:hidden property="valor" />
					<html:hidden property="pg" value="0" />
					<html:hidden property="buscaPedido" value="0" />
					
					<html:submit styleClass="botao-busca" value="Buscar" />
				<input type="button" class="botao-adicionar" value="Adicionar" onclick="document.location.href='abreAdicionaFormaPagamento.do'" />
			</html:form>
		</div>

		<div id="conteudo-principal">

			<table id="tabela">

				<tr class="cabecalho-lista">
					<th colspan="2">Descrição</th>
					<th colspan="2">Forma</th>
					<th colspan="2">Parcelas</th>
					<th colspan="2">Opções</th>
				</tr>

				<c:choose>

					<c:when test="${empty formasPagamento}">
						<tr>
							<td colspan="19" style="color: gray; text-align: center;">Nenhum resultado encontrado!</td>
						</tr>
					</c:when>

					<c:otherwise>

						<c:forEach var="formasPagamento" items="${formasPagamento}">
							<tr>
								<td colspan="2">${formasPagamento.descricaoForma}</td>
								<td colspan="2">${formasPagamento.forma.descricao}</td>
								<td colspan="3">${formasPagamento.parcelas}</td>

								<td colspan="2" align="center">
								<a href="abreEditaFormaPagamento.do?id=${formasPagamento.id}">
								<img src="imgs/edit.png" title="Editar" border="0" /></a> 
								<a href="#" onclick="javascript:deletar(${formasPagamento.id});">
								<img src="imgs/delete.png" align="top" title="Deletar" border="0" /></a></td>

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