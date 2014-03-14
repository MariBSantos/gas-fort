<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>


<script type="text/javascript">
$(function(){			
	$("#dialog-confirm").hide();
	$("#dialog-confirm-2").hide();
	$("#dialog-confirm-3").hide();
	$("#dialog-confirm-4").hide();
	
	$('#tabs').tabs();
});		

function deletar(id) { 			
	$("#dialog:ui-dialog").dialog("destroy");	
	$("#dialog-confirm").dialog({
		resizable: false,
		height: 210,
		modal: true,
		buttons: {
			"Deletar": function() {
				document.location.href="/gas-fort/deletarEndereco.do?id=" + id;
				$(this).dialog("close");
			},
			Cancelar: function() {
				$(this).dialog("close");
			}}})};
			
			function adicionarEndereco(id) { 			
				$("#dialog:ui-dialog").dialog("destroy");	
				$("#dialog-confirm-2").dialog({
					resizable: false,
					height: 350,
					width: 400,
					modal: true,
					buttons: {
						
					}
				});
			}
			function close() { 		
				$(this).dialog("close");
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
				
</script>


</head>
<body>

	<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="0" />
		</c:import>
	</div>

	<div id="dialog-confirm" title="Deletar Endereço">
		<p>
			<span style="float: left; margin: 0 20px 20px 0;"><img
				src="imgs/error.png" /> </span> Tem certeza que deseja remover esse
			endereço?
		</p>
	</div>

	<!-- Cadastro de Enderço -->

	<div id="dialog-confirm-2" title="Adicionar Endereço"
		style="font: 12px verdana;">
		<p>
			<html:form action="/adicionaEndereco" focus="endereco">
				<table align="center">
					<tr>
						<td>Tipo de Cadastro</td>
						<td><html:select property="tipoEndereco"
								styleClass="combo-box" styleId="indice-seletor">
								<html:option value="0">Selecione</html:option>
								<html:option value="1">Endereço de Entrega</html:option>
								<html:option value="2">Endereço de Cobrança</html:option>
							</html:select></td>
					</tr>

					<tr>
						<td>Endereço</td>
						<td><html:text property="endereco" styleClass="cadastro-text"
								maxlength="100"></html:text></td>
					</tr>

					<tr>
						<td>Bairro</td>
						<td><html:text property="bairro" styleClass="cadastro-text"
								maxlength="45"></html:text></td>
					</tr>

					<tr>
						<td>Cidade</td>
						<td><html:text property="cidade" styleClass="cadastro-text"
								maxlength="25"></html:text></td>
					</tr>

					<tr>
						<td>CEP</td>
						<td><html:text property="cep" styleClass="cadastro-text"
								maxlength="11"></html:text></td>
					</tr>

					<tr>
						<td>Estado</td>
						<td><html:select property="estado" styleClass="combo-box"
								styleId="indice-seletor">
								<html:option value="-1">Selecione</html:option>
							<<html:options collection="estados" property="id"
									labelProperty="nome" />
							</html:select></td>
					</tr>

				</table>

				<html:hidden property="cliente" value="${cliente.id}" />

				<html:submit styleClass="botao-adicionar"
					style="float: right; margin-right: 30px;" value="Salvar"></html:submit>
			</html:form>
		</p>
	</div>


	<div id="conteudo">

		<div id="titulo">Edição de Clientes</div>

			<div id="tabs" style="font-family: verdana; font-size: 12px; border: none;">
				<ul>
					<li><a href="#tabs-1">Dados Cadastrais</a></li>
					<li><a href="#tabs-2">Endereços</a></li>
				</ul>

				<div id="tabs-1" style="height: 100%; overflow: auto;">
					<html:form action="/editaCliente" focus="nomeFantasia">

						<table>

							<html:hidden property="id" value="${cliente.id}" />
							<html:hidden property="tipoCadastro"
								value="${cliente.tipoCadastro}" />
							<tr>
								<td>Código</td>
								<td><html:text property="id" styleClass="cadastro-text"
										maxlength="100" value="${cliente.id}" disabled="true" /></td>
							</tr>

							<tr>
								<td>Nome Fantasia</td>
								<td><html:text property="nomeFantasia"
										styleClass="cadastro-text" maxlength="100"
										value="${cliente.nomeFantasia}" /></td>
							</tr>

							<tr>
								<td>Razão Social</td>
								<td><html:text property="razaoSocial"
										styleClass="cadastro-text" maxlength="100"
										value="${cliente.razaoSocial}" /></td>
								<td><html:errors property="razaoSocial"></html:errors></td>
							</tr>

							<c:if test="${cliente.tipoCadastro == 1}">
								<tr>
									<td>CPF</td>
									<td><html:text property="cpf" styleClass="cadastro-text"
											onkeypress="formatar(this, '###.###.###-##')" maxlength="14"
											value="${cliente.cpf}" />
									<td><html:errors property="cpf"></html:errors></td>
								</tr>

								<tr>
									<td>RG</td>
									<td><html:text property="rg" styleClass="cadastro-text"
											value="${cliente.rg}" /></td>
								</tr>

							</c:if>

							<c:if test="${cliente.tipoCadastro == 2}">
								<tr>
									<td>CNPJ</td>
									<td><html:text property="cnpj" styleClass="cadastro-text"
											onkeypress="formatar(this, '##.###.###/####-##')"
											maxlength="18" value="${cliente.cnpj}" /></td>
									<td><html:errors property="cnpj"></html:errors></td>
								</tr>

								<tr>
									<td>IE</td>
									<td><html:text property="ie" styleClass="cadastro-text"
											maxlength="45" value="${cliente.ie}" /></td>
								</tr>
							</c:if>

							<tr>
								<td>Telefone</td>
								<td><html:text property="telefone1"
										styleClass="cadastro-text"
										onkeypress="formatar(this, '##-####-####')" maxlength="20"
										value="${cliente.telefone1}" /></td>
							</tr>

							<tr>
								<td>Telefone 2</td>
								<td><html:text property="telefone2"
										styleClass="cadastro-text"
										onkeypress="formatar(this, '##-####-####')" maxlength="20"
										value="${cliente.telefone2}" /></td>
							</tr>

							<tr>
								<td>Celular</td>
								<td><html:text property="celular"
										styleClass="cadastro-text"
										onkeypress="formatar(this, '##-####-####')" maxlength="20"
										value="${cliente.celular}" /></td>
							</tr>


						</table>
					</html:form>
				</div>


				<div id="tabs-2" style="height: 100%; overflow: auto;">

						<div id="sub-titulo">
							Endereços <a href="#"
								onclick="javascript:adicionarEndereco(${cliente.id});"> <img
								title="Adicionar Endereço" src="imgs/add.png"
								style="float: right; margin-right: 75%;"></a>
						</div>

						<table id="tabela">

							<tr class="cabecalho-lista">
								<th>Tipo</th>
								<th>Endereço</th>
								<th>Bairro</th>
								<th>Cidade</th>
								<th>CEP</th>
								<th>Opções</th>
							</tr>

							<c:choose>

								<c:when test="${empty endereco}">
									<tr>
										<td colspan="6" style="color: gray; text-align: center;">Nenhum
											resultado encontrado!</td>
									</tr>
								</c:when>

								<c:otherwise>

									<c:forEach var="endereco" items="${endereco}">
										<tr>
											<c:if test="${endereco.tipoEndereco == 1}">
												<td>Entrega</td>
											</c:if>
											<c:if test="${endereco.tipoEndereco == 2}">
												<td>Cobrança</td>
											</c:if>

											<td>${endereco.endereco}</td>
											<td>${endereco.bairro}</td>
											<td>${endereco.cidade}</td>
											<td>${endereco.cep}</td>

											<td colspan="2"><a href="#"
												onclick="javascript:editarEndereco(${endereco.id});"> <img
													src="imgs/edit.png" title="Editar" border="0" /></a> <a
												href="#" onclick="javascript:deletar(${endereco.id});">
													<img src="imgs/delete.png" align="top" title="Deletar"
													border="0" />
											</a></td>

										</tr>
									</c:forEach>

								</c:otherwise>

							</c:choose>
						</table>
					</div>
		
		<div id="botoes-pedido">
			<html:submit styleClass="botao-adicionar" value="Salvar"
				style="float: right;"></html:submit>
			<input type="button" class="botao-cancelar" style="float: right;"
				value="Cancelar"
				onclick="javascript:document.location.href='lista-clientes.jsp;' ">
		</div>
		

		</div>
	</div>

</body>
</html>