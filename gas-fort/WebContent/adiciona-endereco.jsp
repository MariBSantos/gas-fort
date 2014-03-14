<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Arc</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />
<link type="text/css" href="css/redmond/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){			
		$("#dialog-confirm").hide();
	});
	
	$(".noEnterSubmit").keypress(function(e) {
		if (e.which == 13) { e.preventDefault(); }
		});
	
	function adicionarEndereco(id) { 			
		$("#dialog:ui-dialog").dialog("destroy");	
		$("#dialog-confirm").dialog({
			resizable: false,
			height: 400,
			width: 450,
			modal: true,
			buttons: {
			}
		});
	}

</script>

</head>
<body>

	<div id="dialog-confirm" title="Adicionar Endereço">
		<p>
			<html:form action="/adicionaEndereco" focus="endereco">
				<table>
					<html:hidden property="cliente" value="${cliente.id}" />
					<tr>
						<td>Tipo de Cadastro</td>
						<td><html:select property="tipoEndereco"
								styleClass="combo-box" styleId="indice-seletor">
								<html:option value="0">Selecione</html:option>
								<html:option value="1">Endereço de Entrega</html:option>
								<html:option value="2">Endereço de Cobrança</html:option>
							</html:select></td>
							<td><html:errors property="tipoEndereco"></html:errors></td>
					</tr>

					<tr>
						<td>Endereço</td>
						<td><html:text property="endereco" styleClass="cadastro-text"
								maxlength="100"></html:text></td>
							<td><html:errors property="endereco" /></td>
					</tr>

					<tr>
						<td>Bairro</td>
						<td><html:text property="bairro" styleClass="cadastro-text"
								maxlength="45"></html:text></td>
								<td><html:errors property="bairro" /></td>
					</tr>

					<tr>
						<td>Cidade</td>
						<td><html:text property="cidade" styleClass="cadastro-text"
								maxlength="45"></html:text></td>
					</tr>

					<tr>
						<td>CEP</td>
						<td><html:text property="cep" styleClass="cadastro-text"
								maxlength="11"></html:text></td>
					</tr>

					<tr>
						<td>Estado</td>
						<td><html:select styleId="estado" property="id" styleClass="combo-box">
								<html:option value="-1">Selecione</html:option>
								<html:options collection="estados" property="id" labelProperty="nome" />
							</html:select>
						</td>
					</tr>

				</table>

				<html:submit styleClass="botao-adicionar" style="float: right;"
					value="Salvar"></html:submit>
				<html:button property="cancelar" styleClass="botao-cancelar"
					style="float: right;" value="Cancelar"></html:button>

			</html:form>


		</p>


	</div>

	<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="0" />
		</c:import>
	</div>
	<div id="conteudo">

		<div id="titulo">Cadastro de Clientes</div>

		<div id="conteudo-edicao" style="bottom: 45px;">

			<div style="padding-left: 30px; font: 12px verdana; color: #0082C8;">
				<p>
					<b> Cliente <i><u>${nomeFantasia}</u></i> cadastrado com
						sucesso!
					</b>
				</p>
			</div>

			<div id="formulario-menor" style="padding-top: 10px;">

				<div id="sub-titulo">
					<a href="#" onclick="javascript:adicionarEndereco(${cliente.id})">
						<img title="Adicionar Contato" src="imgs/add.png" style="float: right; margin-right: 75%;">
					</a> <b>Endereços</b>
				</div>

				<table id="tabela">

					<tr class="cabecalho-lista">
						<th>Endereço</th>
						<th>Bairro</th>
						<th>Cidade</th>
						<th>CEP</th>
						<th>Estado</th>
						<th>Opções</th>


					</tr>

					<c:forEach var="endereco" items="${endereco}">
						<tr>


							<td colspan="2" align="center"><a
								href="abreEditaContato.do?id=${endereco.id}"><img
									src="imgs/edit.png" /></a> <a href="#"
								onclick="javascript:deletarContato(${endereco.id});"><img
									src="imgs/delete.png" align="top" /></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>

	</div>

</body>
</html>