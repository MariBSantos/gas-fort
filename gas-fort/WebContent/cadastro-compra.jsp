<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		$("#dialog-confirm-edita-produto").hide();
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

				$("#indice-produto").change(
		  		  		function() {
		  		  				$("#descricao").empty();
		  		  				$("#volume").empty();
		  		  				$("#valor").empty();
		  		  				$.getJSON('carregaProduto.do?produto=' + $("#indice-produto").val(),
		  		  						function(data) {
		  		  							$("#idProduto").val(data.id);
		  		  							$("#descricao").val(data.descricao);
		  		  							$("#volume").val(data.volume);
		  		  							$("#valor").val(data.valor);
		  		  							
		  		  						});
		  		  				});
	
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
		alert(quantidade);
		var preco = $('#valor').val().replace(",",".");
		alert(preco);
		var total = quantidade * preco;
		alert(total);
		$('#valor_total').val(total).replace(".",",");
		

	};
	
	function deletar(id) { 		
		document.location.href="/gas-fort/deletarProdutoCompra.do?id=" + id;
	};
	
	function editar(id) {
		$("#dialog:ui-dialog").dialog("destroy");
		$("#dialog-confirm-edita-produto").dialog({
			height: 300,
			width: 420,
		});
		$("#produto-edit").empty();
		$("#valor").empty();
		$("#quantidade").empty();
		$("#valor_total").empty();
		$.getJSON('abreEditaProdutoCompra.do?produto=' + id,
				function(data) {
					$("#id-edit").val(data.id);
					$("#indice-produto-edit").val(data.produto);
					$("#valor-edit").val(data.valor);
					$("#quantidade-edit").val(data.quantidade);
					$("#valor_total-edit").val(data.valor_total);
				});
		$("#dialog-confirm-produto").dialog("close");
		};
		
		$(function() {
		    $( "#tabs" ).tabs();
		  });
	
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
					<td><html:select property="produto" styleClass="combo-box"
							styleId="indice-produto">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="produtos" property="id"
								labelProperty="descricao" />
						</html:select></td>
				</tr>
				<tr>
					<td>Valor Unitário:</td>
					<td><html:text styleId="valor" styleClass="cadastro-text"
							style="width: 100px" property="valor" value="${produto.valor}"></html:text></td>
				</tr>
				<tr>
					<td>Quantidade:</td>
					<td><html:text styleId="quantidade" styleClass="cadastro-text"
							style="width: 100px" property="quantidade"></html:text></td>
				</tr>
				<tr>
					<td>Valor Total:</td>
					<td><html:text styleId="valor_total"
							styleClass="cadastro-text" style="width: 100px"
							property="valor_total" onfocus="javascript:calcular();"></html:text></td>
			</table>
			<html:submit styleClass="botao-adicionar" value="Salvar"
				style="margin-top: 40px; float: right; margin-left: 5px;"></html:submit>
			<a href="javascript:fechaProduto();"><input type="button"
				class="botao-cancelar" style="margin-top: 40px; float: right;"
				value="Cancelar"></a>
		</html:form>
	</div>

	<div id="dialog-confirm-edita-produto" title="Produto"
		style="font-size: 0.8em">
		<html:form action="/editaProdutoCompra">
			<table>
				<html:hidden property="edicao" value="true" />
				<tr>
					<td>Produto:</td>
					<td><html:select property="produto" styleClass="combo-box"
							styleId="indice-produto-edit" value="${produ.produto.id}">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="produtos" property="id"
								labelProperty="descricao" />
						</html:select></td>
				</tr>
				<tr>
					<td>Valor Unitário:</td>
					<td><html:text styleId="valor-edit" styleClass="cadastro-text"
							style="width: 100px" property="valor" value="${produ.valor}"></html:text></td>
				</tr>
				<tr>
					<td>Quantidade:</td>
					<td><html:text styleId="quantidade-edit"
							styleClass="cadastro-text" style="width: 100px"
							property="quantidade" value="${produ.quantidade}"></html:text></td>
				</tr>
				<tr>
					<td>Valor Total:</td>
					<td><html:text styleId="valor_total-edit"
							styleClass="cadastro-text" style="width: 100px"
							property="valor_total" value="${produ.valor_total}"
							onfocus="javascript:calcular();"></html:text></td>
			</table>
			<html:submit styleClass="botao-adicionar" value="Salvar"
				style="margin-top: 40px; float: right; margin-left: 5px;"></html:submit>
			<a href="javascript:fechaProduto();"><input type="button"
				class="botao-cancelar" style="margin-top: 40px; float: right;"
				value="Cancelar"></a>
		</html:form>
	</div>

	<div id="conteudo">

		<html:form action="/cadastroCompra">

			<html:hidden property="edicao" value="false" />

			<div>Pedido Nº Data de Emissão:</div>

			<div id="tabs"
				style="margin-top: 5%; font-size: small; border: none;">
				<ul>
					<li><a href="#tabs-1">Cliente</a></li>
					<li><a href="#tabs-2">Forma de Pagamento</a></li>
					<li><a href="#tabs-3">Produto</a></li>
				</ul>

				<!-- Chamada Fornecedor -->

				<div id="tabs-1" style="height: 100%; overflow: auto;">

					<table>
						<tr>
							<td style="width: 80px;"><b>Fornecedor</b></td>
							<td><a href="javascript:adicionarFornecedor();"> <input
									type="button" class="botao-adicionar" value="Adicionar">
							</a></td>
							<td><html:errors property="fornecedor"></html:errors></td>
						</tr>
					</table>

					<!-- Combo Fornecedor -->

					<div id="dialog-confirm-fornecedor" title="Fornecedor"
						style="font-size: 0.8em">
						<html:select property="listaFornecedor" styleClass="combo-box"
							styleId="indice-fornecedor">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="fornecedores" property="id"
								labelProperty="nomeFantasia" />
						</html:select>
						<a href="javascript:carregaFornecedor();"> <input
							type="button" class="botao-adicionar"
							style="margin-top: 80px; float: right; margin-left: 5px;"
							value="Salvar"></a> <a href="javascript:fechaFornecedor();">
							<input type="button" class="botao-cancelar"
							style="margin-top: 80px; float: right;" value="Cancelar">
						</a>
					</div>

					<!-- Formulário Fornecedor -->

					<table
						style="border-top-style: groove; padding-top: 10px; width: 100%;">

						<html:hidden property="fornecedor" styleId="idFornecedor"
							value="${forn.id}" />

						<tr>
							<td style="width: 100px;">Fantasia:</td>
							<td><html:text styleId="nomeFantasia" property="fornecedor"
									value="${forn.nomeFantasia}"
									styleClass="cadastro-text-disabled" readonly="true"
									disabled="true"></html:text></td>
						</tr>
						<tr>
							<td style="width: 100px;">Razão Social:</td>
							<td><html:text styleId="razaoSocial" property="fornecedor"
									value="${forn.razaoSocial}" styleClass="cadastro-text-disabled"
									readonly="true" disabled="true"></html:text></td>
						</tr>
						<tr>
							<td style="padding-right: 5px;">CNPJ</td>
							<td><html:text styleId="cnpj" property="fornecedor"
									value="${forn.cnpj}" styleClass="cadastro-text-disabled"></html:text>
							</td>
						</tr>
						<tr>
							<td style="padding-right: 5px;">IE</td>
							<td><html:text styleId="ie" property="fornecedor"
									value="${forn.ie}" styleClass="cadastro-text-disabled"></html:text>
							</td>
						</tr>
						<tr>
							<td style="padding-right: 5px;">Telefone:</td>
							<td><html:text styleId="telefone1" property="fornecedor"
									value="${forn.telefone1}" styleClass="cadastro-text-disabled"
									readonly="true" disabled="true"></html:text></td>
						</tr>
						<tr>
							<td style="padding-right: 5px;">Celular:</td>
							<td><html:text styleId="celular" property="fornecedor"
									value="${forn.celular}" styleClass="cadastro-text-disabled"
									readonly="true" disabled="true"></html:text></td>
						</tr>
					</table>
				</div>

				<!-- Chamada Forma de Pagamento -->

				<div id="tabs-2">

					<table style="height: 30px;">
						<tr>
							<td style="width: 80px;"><b>Pagamento</b></td>
							<td><a href="javascript:adicionarFormaPagamento();"><input
									type="button" class="botao-adicionar" value="Adicionar"></a>
							</td>
							<td><html:errors property="formaPagamento"></html:errors></td>
						</tr>
					</table>

					<!-- Combo Forma de Pagamento -->
					<div id="dialog-confirm-forma" title="Forma de pagamento"
						style="font-size: 0.8em">
						<html:select property="listaFormaPagamento" styleClass="combo-box"
							styleId="indice-forma">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="formas" property="id"
								labelProperty="descricaoForma" />
						</html:select>
						<a href="javascript:carregaForma();"> <input type="button"
							class="botao-adicionar"
							style="margin-top: 80px; float: right; margin-left: 5px;"
							value="Salvar"></a> <a href="javascript:fechaForma();"> <input
							type="button" class="botao-cancelar"
							style="margin-top: 80px; float: right;" value="Cancelar"></a>
					</div>

					<!-- Formulário Forma de Pagamento -->
					<table
						style="border-top-style: groove; padding-top: 10px; width: 100%; padding-bottom: 3px;">

						<html:hidden property="formaPagamento" styleId="idForma"
							value="${formaPagamento.id}" />

						<tr>
							<td style="width: 100px;">Pagamento:</td>
							<td><html:text styleId="descricaoForma"
									property="formaPagamento"
									value="${formaPagamento.descricaoForma}"
									styleClass="cadastro-text-disabled" readonly="true"
									disabled="true">
								</html:text></td>
						</tr>
						<tr>
							<td style="width: 100px;">Parcelas:</td>
							<td><html:text styleId="parcelas" property="formaPagamento"
									value="${formaPagamento.parcelas}"
									styleClass="cadastro-text-disabled" readonly="true"
									disabled="true">
								</html:text></td>
						</tr>
					</table>
				</div>

				<!-- Chamada Produto -->

				<div id="tabs-3">

					<table style="height: 30px;">
						<tr>
							<td style="width: 80px;"><b>Produtos</b></td>
							<td><a href="javascript:adicionarProduto();"><input
									type="button" class="botao-adicionar" value="Adicionar"></a></td>
						</tr>
					</table>

					<table
						style="border-top-style: groove; border-spacing: 0px; border-collapse: collapse;">

						<html:hidden property="produto" styleId="idProduto" />

						<tr>
							<th
								style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Descrição</th>
							<th
								style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Volume</th>
							<th
								style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Valor
								Unitário</th>
							<th
								style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Quantidade</th>
							<th
								style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Valor
								Total</th>
						</tr>

						<tr style="height: 5px;">
							<td></td>
						</tr>

						<c:forEach var="produtoCompra" items="${produtoCompra}">
							<tr style="border: solid; border-width: thin; height: 30px;">
								<td style="width: 150px">${produtoCompra.produto.descricao}</td>
								<td style="width: 150px">${produtoCompra.produto.volume}</td>
								<td><div style="width: 150px">
										<fmt:formatNumber value="${produtoCompra.valor}"
											minFractionDigits="2" type="currency" />
									</div></td>
								<td style="width: 150px">${produtoCompra.quantidade}</td>
								<td><div style="width: 150px">
										<fmt:formatNumber value="${produtoCompra.valor_total}"
											minFractionDigits="2" type="currency" />
									</div></td>
								<td style="border-style: none;"><a href="#"
									onclick="javascript:editar(${produtoCompra.produto.id});">
										<img src="imgs/page_edit.png">
								</a> <a href="#"
									onclick="javascript:deletar(${produtoCompra.produto.id});">
										<img src="imgs/delete.png">
								</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>


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