<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>LinQgaz</title>

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery-ui.css" />


<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>

<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true,
			active : false,
		});
	});
</script>

</head>

<body>

<c:import url="cabecalho.jsp"></c:import>

	<div id="conteudo">

		<div id="menu lateral">
			<c:import url="principal.jsp"></c:import>
		</div>

		<div id="interno">
			<div align="center" style="margin-top: 15%;">
				<img style="padding-right: 10px;" src="imgs/contacts.png">Módulo de Cadastro
			</div>
			<div align="center" style="font-family: Helvetica, Arial, 'Liberation Sans', FreeSans, sans-serif; font-size: 0.6em; font-variant: small-caps; padding-top: 20px;">
				Selecione ao lado o ítem que deseja cadastrar, editar ou excluir</div>
		</div>

	</div>
</body>