<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>LinQgaz</title>

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery-ui.css" />


<script src="js/jquery-ui.js"></script>

<script>
	$(function() {
		var selecao = (parseInt("${param.menu}"));
		$("#accordion").accordion({
			collapsible : true,
			active : selecao,
		});
	});
</script>

</head>

<body>

	<div id="menu-lateral">
		<div id="accordion">
			<h3>Cadastro</h3>
			<div>
				<p>
					<a href="abreBuscaCliente.do">Cliente</a>
				</p>
				<p>
					<a href="abreBuscaFormaPagamento.do">Forma de Pagamento</a>
				</p>
				<p>
					<a href="abreBuscaFornecedor.do">Fornecedor</a>
				</p>
				<p>
					<a href="abreBuscaProduto.do">Produto</a>
				</p>
				<p>
					<a href="abreCadastroEmpresa.do">Empresa</a>
				</p>
				<p>
					<a href="abreBuscaUsuario.do">Usuário</a>
				</p>
			</div>
			<h3>Compras</h3>
			<div>
				<p>
					<a href="abreBuscaCompra.do">Pedidos de Compra</a>
				</p>
			</div>
			<h3>Vendas</h3>
			<div>
				<p>
					<a href="abreBuscaVenda.do">Pedidos de Venda</a>
				</p>
			</div>
			<h3>Relatórios</h3>
			<div>
				<p>
					<a href="abreAuditoria.do">Auditoria</a>
				</p>
				<p>
					<a href="abreEstoque.do">Estoque</a>
				</p>
				<p>
					<a href="abreRelatorioCliente.do">Clientes</a>
				</p>
				<p>
					<a href="abreRelatorioProduto.do">Produtos</a>
				</p>
			</div>
			<h3>Configurações</h3>
		</div>
	</div>


</body>