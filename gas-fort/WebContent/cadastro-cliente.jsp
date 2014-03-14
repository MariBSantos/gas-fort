<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>LinQgaz</title>
	<link rel="shortcut icon" href="imgs/metro.ico" />
	
	<link type="text/css" href="css/gas-fort.css" rel="stylesheet"/>
	
	 <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	 
	 <script>
	 $(document).ready(function() {
			$('#indice-seletor').change(function() {
				$('.esconder').hide();
				$('[title='+ $("#indice-seletor option[value= " + $(this).val() +"]").text() +']').show();
			});
			
			$('#indice-seletor').change();
		});
	 
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
		<div id="conteudo">
			
			<div id="titulo">Clientes</div>
			
			<html:form action="/adicionaCliente" focus="nomeFantasia">
			
			<div id="formulario">
			<table>
					<tr>
					<td>Tipo de Cadastro</td>
					<td><html:select property="tipoCadastro" styleClass="combo-box" styleId="indice-seletor">
							<html:option value="0">Selecione</html:option>
							<html:option value="1">Pessoa Física</html:option>
						<html:option value="2">Pessoa Jurídica</html:option>
						</html:select>
					</td>
					<td><html:errors property="tipoCadastro"></html:errors></td>
					</tr>
					
					<tr>
						<td>Nome Fantasia</td>
						<td><html:text property="nomeFantasia" styleClass="cadastro-text" maxlength="100"></html:text></td>
					</tr>
					
					<tr>
						<td>Razão Social</td>
						<td><html:text property="razaoSocial" styleClass="cadastro-text" maxlength="100"></html:text></td>
						<td><html:errors property="razaoSocial"></html:errors></td>
					</tr>
					
					<tr title="Pessoa Física" class="esconder">
						<td class="cpf">CPF</td>
						<td><html:text property="cpf" styleClass="cadastro-text cpf" styleId="pessoa-fisica-combo" onkeypress="formatar(this, '###.###.###-##')" maxlength="14"></html:text></td>
						<td><html:errors property="cpf"></html:errors></td>
					</tr>
					
					<tr title="Pessoa Física" class="esconder">
						<td class="rg">RG</td>
						<td><html:text property="rg" styleClass="cadastro-text rg" maxlength="50"></html:text></td>
					</tr>

					<tr title="Pessoa Jurídica" class="esconder">
						<td class="cnpj">CNPJ</td>
						<td><html:text property="cnpj" styleClass="cadastro-text cnpj" onkeypress="formatar(this, '##.###.###/####-##')" maxlength="18"></html:text></td>
						<td><html:errors property="cnpj"></html:errors></td>
					</tr>
					
					<tr title="Pessoa Jurídica" class="esconder">
						<td class="ie">IE</td>
						<td><html:text property="ie" styleClass="cadastro-text ie" maxlength="45"></html:text></td>
					</tr>
					
					<tr>
						<td>Telefone: </td>
						<td><html:text property="telefone1" styleClass="cadastro-text" onkeypress="formatar(this, '##-####-####')" maxlength="20"></html:text></td>
					</tr>
					
					<tr>
						<td>Telefone 2: </td>
						<td><html:text property="telefone2" styleClass="cadastro-text" onkeypress="formatar(this, '##-####-####')" maxlength="20"></html:text></td>
					</tr>
					
					<tr>
						<td>Celular: </td>
						<td><html:text property="celular" styleClass="cadastro-text" onkeypress="formatar(this, '##-#####-####')" maxlength="20"></html:text></td>
					</tr>
					
			</table>
			</div>
		
		<div id="botoes">
			<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right"></html:submit>
			<input type="button" class="botao-cancelar"  style="float: right" value="Cancelar" onclick="javascript:document.location.href='lista-clientes.jsp;' ">
		</div>
		
			</html:form>
			
			
		</div>
	
</body>
</html>