<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/arc-admin.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script>

	$(function() {
		$("#dialog-confirm-fornecedor").hide();
		$("#dialog-confirm-forma").hide();
		$("#dialog-confirm-produto").hide();
		});
	
				function carregaFornecedor() {
					$("#nome").empty();
					$("#cnpj").empty();
					$("#ie").empty();
					$("#endereco").empty();
					$("#bairro").empty();
					$("#cidade").empty();
					$("#telefone1").empty();
					$("#celular").empty();
					$.getJSON('carregaFornecedor.do?fornecedor=' + $("#indice-fornecedor").val(),
							function(data) {
								$("#idFornecedor").val(data.id);
								$("#nomeFantasia").val(data.nomeFantasia);
								$("#razaoSocial").val(data.razaoSocial);
								$("#cnpj").val(data.cnpj);
								$("#ie").val(data.ie);
								$("#endereco").val(data.endereco);
								$("#bairro").val(data.bairro);
								$("#cidade").val(data.cidade);
								$("#telefone1").val(data.telefone1);
								$("#celular").val(data.celular);
								
								$("#dialog-confirm-fornecedor").dialog("close");
							});
				};

		function carregaProduto() {
				$("#descricao").empty();
				$("#volume").empty();
				$("#valorUnitario").empty();
				$.getJSON('carregaProduto.do?produto=' + $("#indice-produto").val(),
						function(data) {
							$("#idProduto").val(data.id);
							$("#descricao").val(data.descricao);
							$("#volume").val(data.volume);
							$("#valor").val(data.valor);
							
							document.location.href="/gas-fort/buscaProdutoPedido.do?id=";
						});
				$("#dialog-confirm-produto").dialog("close");
				};
	
		function carregaForma() {
				$("#descricaoForma").empty();
				$("#forma").empty();
				$("#parcelas").empty();
				$.getJSON('carregaFormaPagamento.do?formaPagamento=' + $("#indice-forma").val(),
						function(data) {
							$("#idForma").val(data.id);
							$("#descricaoForma").val(data.descricaoForma);
							$("#forma").val(data.forma);
							$("#parcelas").val(data.parcelas);
							});
				$("#dialog-confirm-forma").dialog("close");
				};
	
	function adicionarFornecedor() { 			
		$("#dialog:ui-dialog").dialog("destroy");	
		$("#dialog-confirm-fornecedor").dialog({
			resizable: false,
			height: 250,
			width: 350,
			modal: true,
			buttons: {
				
			}
		
		});
	}
	
	function fechaFornecedor()
	{
		$("#dialog-confirm-fornecedor").dialog("close");
	}
	
	function adicionarFormaPagamento() { 			
		$("#dialog:ui-dialog").dialog("destroy");	
		$("#dialog-confirm-forma").dialog({
			resizable: false,
			height: 250,
			width: 350,
			modal: true,
			buttons: {
			}
		});
	}
	
	function fechaForma(){
		$("#dialog-confirm-forma").dialog("close");
	}
	
	function adicionarProduto() { 			
		$("#dialog:ui-dialog").dialog("destroy");	
		$("#dialog-confirm-produto").dialog({
			resizable: false,
			height: 300,
			width: 420,
			modal: true,
			buttons: {
			}
		});
	}
	
	function fechaProduto(){
		$("#dialog-confirm-produto").dialog("close");
	}

	
	function calcular()
	{
		var quantidade = $('#quantidade').val().replace(",",".");
		var preco = $('#valor').val().replace(",",".");;
		var total = parseFloat(quantidade) * parseFloat(preco);
		$('#valorTotal').val(total).replace(".",",");
		

	};
	
	function deletar(id) { 		
		document.location.href="/gas-fort/deletarProdutoCompra.do?id=" + id;
	};
	
</script>
</head>
<body>

	<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="1" />
		</c:import>
	</div>

	<div id="dialog-confirm-produto" title="Produto"
		style="font-size: 0.8em">
		<html:form action="/buscaProdutoCompra">
			<table>
			<html:hidden property="edicao" value="true" />
				<tr>
					<td>Produto:</td>
					<td><html:select property="produto" styleClass="combo-box" styleId="indice-produto">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="produtos" property="id" labelProperty="descricao" />
						</html:select></td>
				</tr>
				<tr>
					<td>Valor Unitário:</td>
					<td><html:text styleId="valor" styleClass="cadastro-text" style="width: 100px" property="valor" value="${produto.valor}"></html:text></td>
				</tr>
				<tr>
					<td>Quantidade:</td>
					<td><html:text styleId="quantidade" styleClass="cadastro-text" style="width: 100px" property="quantidade"></html:text></td>
				</tr>
				<tr>
					<td>Valor Total:</td>
					<td><html:text styleId="valor_total" styleClass="cadastro-text" style="width: 100px" property="valor_total" 
					onfocus="javascript:calcular();"></html:text></td>
			</table>
			<html:submit styleClass="botao-adicionar" value="Salvar" style="margin-top: 40px; float: right; margin-left: 5px;"></html:submit>
			<a href="javascript:fechaProduto();"><input type="button" class="botao-cancelar" style="margin-top: 40px; float: right;"
				value="Cancelar"></a>
		</html:form>
	</div>

	<div id="conteudo">

		<div id="formulario-pedido">

			<html:form action="/editaCompra">
			
			<html:hidden property="edicao" value="false" />
			<html:hidden property="id" value="${compra.id}" />

				<div id="pedido">

					<!-- Chamada Fornecedor -->
					<table style="height: 30px; margin-top: 10px;">
						<tr>
							<td style="width: 80px;"><b>Fornecedor</b></td>
							<td><a href="javascript:adicionarFornecedor();">
								<input type="button" class="botao-adicionar" value="Adicionar"></a>
							</td>
							<td><html:errors property="cliente"></html:errors></td>
						</tr>
					</table>

					<!-- Combo Fornecedor -->

					<div id="dialog-confirm-fornecedor" title="Fornecedor" style="font-size: 0.8em">
						<html:select property="listaFornecedor" styleClass="combo-box" styleId="indice-fornecedor">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="fornecedores" property="id" labelProperty="nomeFantasia" />
						</html:select>
							<a href="javascript:carregaFornecedor();">
							<input type="button" class="botao-adicionar" style="margin-top: 80px; float: right; margin-left: 5px;" value="Salvar"></a> 
							<a href="javascript:fechaCliente();">
							<input type="button" class="botao-cancelar" style="margin-top: 80px; float: right;" value="Cancelar"></a>
					</div>

					<!-- Formulário Fornecedor -->

									<table
						style="border-bottom-style: solid; border-top-style: groove; margin-top: 10px; width: 100%; padding-bottom: 3px;">

						<html:hidden property="fornecedor" styleId="idFornecedor" value="${forn.id}" />

						<tr>
							<td style="width: 100px;">Fantasia:</td>
							<td>
								<html:text styleId="nomeFantasia" property="fornecedor" value="${forn.nomeFantasia}" styleClass="cadastro-text-disabled" readonly="true" disabled="true"></html:text>
							</td>
							<td style="width: 100px;">Razão Social:</td>
							<td>
								<html:text styleId="razaoSocial" property="fornecedor" value="${forn.razaoSocial}" styleClass="cadastro-text-disabled" readonly="true" disabled="true"></html:text>
							</td>
						</tr>
						<tr>
							<td style="padding-right: 5px;">CNPJ</td>
							<td>
								<html:text styleId="cnpj" property="fornecedor" value="${forn.cnpj}" styleClass="cadastro-text-disabled"></html:text>
							</td>

							<td style="padding-right: 5px;">IE</td>
							<td>
								<html:text styleId="ie" property="fornecedor" value="${forn.ie}" styleClass="cadastro-text-disabled"></html:text>
							</td>
						</tr>
						<tr>
							<td style="padding-right: 5px;">Telefone:</td>
							<td>
								<html:text styleId="telefone1" property="fornecedor" value="${forn.telefone1}" styleClass="cadastro-text-disabled" readonly="true" disabled="true"></html:text>
							</td>
							<td style="padding-right: 5px;">Celular:</td>
							<td>
								<html:text styleId="celular" property="fornecedor" value="${forn.celular}" styleClass="cadastro-text-disabled" readonly="true" disabled="true"></html:text>
							</td>
						</tr>
					</table>

					<!-- Chamada Forma de Pagamento -->
					<table style="height: 30px; margin-top: 10px;">
						<tr>
							<td style="width: 80px;"><b>Pagamento</b></td>
							<td><a href="javascript:adicionarFormaPagamento();">
								<input type="button" class="botao-adicionar" value="Adicionar"></a>
							</td>
							<td><html:errors property="formaPagamento"></html:errors></td>
						</tr>
					</table>

					<!-- Combo Forma de Pagamento -->
					<div id="dialog-confirm-forma" title="Forma de pagamento" style="font-size: 0.8em">
						<html:select property="listaFormaPagamento" styleClass="combo-box" styleId="indice-forma">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="listaFormaPagamento" property="id" labelProperty="descricaoForma" />
						</html:select>
						<a href="javascript:carregaForma();"><input type="button" class="botao-adicionar" style="margin-top: 80px; float: right; margin-left: 5px;" value="Salvar"></a> 
						<a href="javascript:fechaForma();"><input type="button" class="botao-cancelar" style="margin-top: 80px; float: right;" value="Cancelar"></a>
					</div>

					<!-- Formulário Forma de Pagamento -->
					<table
						style="border-bottom-style: solid; border-top-style: groove; margin-top: 10px; width: 100%; padding-bottom: 3px;">

						<html:hidden property="formaPagamento" styleId="idForma" value="${formaPagamento.id }" />

						<tr>
							<td style="width: 100px;">Pagamento:</td>
							<td>
								<html:text styleId="descricaoForma" property="formaPagamento" value="${formaPagamento.descricaoForma}" styleClass="cadastro-text-disabled" readonly="true"
									disabled="true">
								</html:text></td>

							<td style="width: 100px;">Parcelas:</td>
							<td><html:text styleId="parcelas" property="formaPagamento" value="${formaPagamento.parcelas}" styleClass="cadastro-text-disabled" readonly="true"
									disabled="true">
								</html:text></td>
						</tr>
					</table>

					<!-- Chamada Produto -->
					<table style="height: 30px; margin-top: 10px;">
						<tr>
							<td style="width: 80px;"><b>Produtos</b></td>
							<td><a href="javascript:adicionarProduto();">
								<input type="button" class="botao-adicionar" value="Adicionar"></a></td>
						</tr>
					</table>

					<table
						style="border-bottom-style: solid; border-top-style: groove; margin-top: 10px; width: 100%; padding-bottom: 3px;">

						<html:hidden property="produto" styleId="idProduto" />

						<tr>
							<th style="text-align: left;">Descrição</th>
							<th style="text-align: left;">Volume</th>
							<th style="text-align: left;">Valor Unitário</th>
							<th style="text-align: left;">Quantidade</th>
							<th style="text-align: left;">Valor Total</th>
						</tr>

						<c:forEach var="produtoCompra" items="${produtoCompra}">
							<tr>
								<td><input type="text" class="cadastro-text-disabled" style="width: 150px" value="${produtoCompra.produto.descricao}"/></td>
								<td><input type="text" class="cadastro-text-disabled" style="width: 150px" value="${produtoCompra.produto.volume}"/></td>
								<td><div class="cadastro-text-disabled" style="width: 150px">
									<fmt:formatNumber value="${produtoCompra.valor}" minFractionDigits="2" type="currency"/></div>
								</td>
								<td><input type="text" class="cadastro-text-disabled" style="width: 150px" value="${produtoCompra.quantidade}"/></td>
								<td><div class="cadastro-text-disabled" style="width: 150px">
									<fmt:formatNumber value="${produtoCompra.valor_total}" minFractionDigits="2" type="currency"/></div>
								</td>

								<td>
									<a href="#" onclick="javascript:deletar(${produtoCompra.produto.id});">
									<img src="imgs/delete.png"></a>
								</td>
							</tr>
						</c:forEach>
					</table>


					<div id="botoes-pedido">
						<html:submit styleClass="botao-adicionar" value="Salvar"
							style="float: right"></html:submit>
						<input type="button" class="botao-cancelar" style="float: right"
							value="Cancelar"
							onclick="javascript:document.location.href='lista-clientes.jsp;' ">
					</div>
				</div>

			</html:form>

		</div>

	</div>
</body>
</html>