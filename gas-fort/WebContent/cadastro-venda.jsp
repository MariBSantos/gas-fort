<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">

	var selecao = (parseInt('${aba}'));
		if ('${aba}' == ''){
			selecao = 0;
		}
		
		else {
			selecao = (parseInt('${aba}'));
		}
		
      $(document).ready(function() {   
    	  $('#tabs').tabs({
  			collapsible : true,
  			active : selecao,
  		});
    	 
      });
      
      $(function() {
  		$('.pessoaFisica').hide();
  		$('.pessoaJuridica').hide();
  		$("#dialog-confirm-cliente").hide();
  		$("#dialog-confirm-forma").hide();
  		$("#dialog-confirm-produto").hide();
  		
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
  		});
  	
  				function carregaCliente() {
  					$("#nome").empty();
  					$("#cpf").empty();
  					$("#rg").empty();
  					$("#cnpj").empty();
  					$("#ie").empty();
  					$("#endereco").empty();
  					$("#bairro").empty();
  					$("#cidade").empty();
  					$("#telefone1").empty();
  					$("#celular").empty();
  					$.getJSON('carregaCliente.do?cliente=' + $("#indice-cliente").val(),
  							function(data) {
  								$("#idCliente").val(data.id);
  								$("#nomeFantasia").val(data.nomeFantasia);
  								$("#razaoSocial").val(data.razaoSocial);
  								$("#cpf").val(data.cpf);
  								$("#rg").val(data.rg);
  								$("#cnpj").val(data.cnpj);
  								$("#ie").val(data.nomeFantasia);
  								$("#endereco").val(data.endereco);
  								$("#bairro").val(data.bairro);
  								$("#cidade").val(data.cidade);
  								$("#telefone1").val(data.telefone1);
  								$("#celular").val(data.celular);
  								$("#tipoCadastro").val(data.tipoCadastro);
  								
  								var tipo = data.tipoCadastro;
  								
  								if(tipo == 1){
  									$('.pessoaFisica').show();
  								}
  								
  								else{
  									$('.pessoaJuridica').show();
  								}
  								
  								$("#dialog-confirm-cliente").dialog("close");
  							});
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
  	
  	function adicionarCliente() { 			
  		$("#dialog:ui-dialog").dialog("destroy");	
  		$("#dialog-confirm-cliente").dialog({
  			resizable: false,
  			height: 250,
  			width: 350,
  			modal: true,
  			buttons: {
  				
  			}
  		
  		});
  	}
  	
  	function fechaCliente()
  	{
  		$("#dialog-confirm-cliente").dialog("close");
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
  		$("#indice-produto").val(-1);
  		$("#valor").val("");
  		$("#quantidade").val("");
  		$("#valor_total").val("");
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
  	};
  	
  	function deletar(id) { 		
  		document.location.href="/gas-fort/deletarProdutoVenda.do?id=" + id;
  	};
  	
  	function formatar()
	{
		var t = $('#teste').val().replace(",",".");
		$('#valor').val(t);
	};
  	
  	function calcular()
	{
		var quantidade = $('#quantidade').val();
		var preco = $('#valor').val().replace("R$", "");
		//preco = preco.replace(".","");
		//preco = preco.replace(",",".");
		var total = parseInt(quantidade) * parseFloat(preco);
		
		$('#valor_total').val("R$" + total);

	};
	
	function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e){
	    var sep = 0;
	    var key = '';
	    var i = j = 0;
	    var len = len2 = 0;
	    var strCheck = '0123456789';
	    var aux = aux2 = '';
	    var whichCode = (window.Event) ? e.which : e.keyCode;
	    if (whichCode == 13) return true;
	    key = String.fromCharCode(whichCode); // Valor para o código da Chave
	    if (strCheck.indexOf(key) == -1) return false; // Chave inválida
	    len = objTextBox.value.length;
	    for(i = 0; i < len; i++)
	        if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal)) break;
	    aux = '';
	    for(; i < len; i++)
	        if (strCheck.indexOf(objTextBox.value.charAt(i))!=-1) aux += objTextBox.value.charAt(i);
	    aux += key;
	    len = aux.length;
	    if (len == 0) objTextBox.value = '';
	    if (len == 1) objTextBox.value = '0'+ SeparadorDecimal + '0' + aux;
	    if (len == 2) objTextBox.value = '0'+ SeparadorDecimal + aux;
	    if (len > 2) {
	        aux2 = '';
	        for (j = 0, i = len - 3; i >= 0; i--) {
	            if (j == 3) {
	                aux2 += SeparadorMilesimo;
	                j = 0;
	            }
	            aux2 += aux.charAt(i);
	            j++;
	        }
	        objTextBox.value = '';
	        len2 = aux2.length;
	        for (i = len2 - 1; i >= 0; i--)
	        objTextBox.value += aux2.charAt(i);
	        objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);
	    }
	    return false;
	};
	
    </script>
</head>
<body>

	<c:import url="cabecalho.jsp"></c:import>

	<div id="menu lateral">
		<c:import url="principal.jsp">
			<c:param name="menu" value="2" />
		</c:import>
	</div>

	<div id="dialog-confirm-produto" title="Produto"
		style="font-size: 0.8em">
		<html:form action="/buscaProdutoVenda">
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
					<td>
						 <input type="text" name="teste" id="teste"  onKeyPress="return(MascaraMoeda(this,'.',',',event))"
						 onblur="formatar()"/>
						<html:hidden property="valor" styleId="valor" />
					</td>
				</tr>
				<tr>
					<td>Quantidade:</td>
					<td><html:text styleId="quantidade" styleClass="cadastro-text" style="width: 100px; text-align: right;" property="quantidade"></html:text></td>
				</tr>
				<tr>
					<td>Valor Total:</td>
					<td>
					<html:text styleId="valor_total" styleClass="cadastro-text" style="width: 100px; text-align: right;" property="valor_total" 
					onfocus="javascript:calcular();"></html:text></td>
			</table>
			<html:submit styleClass="botao-adicionar" value="Salvar" style="margin-top: 40px; float: right; margin-left: 5px;"></html:submit>
			<a href="javascript:fechaProduto();"><input type="button" class="botao-cancelar" style="margin-top: 40px; float: right;"
				value="Cancelar"></a>
		</html:form>
	</div>

	<div id="conteudo">

			<html:form action="/cadastroVenda">
			
			<html:hidden property="edicao" value="false" />
			
			<div>Pedido Nº Data de Emissão:</div>
			
			<div id="tabs" style="margin-top: 5%; font-size: small; border: none;">
  				<ul>
    				<li><a href="#tabs-1">Cliente</a></li>
    				<li><a href="#tabs-2">Forma de Pagamento</a></li>
    				<li><a href="#tabs-3">Produto</a></li>
  				</ul>
  				
					<!-- Chamada Cliente -->
					
				<div id="tabs-1" style="height: 100%; overflow: auto;">
					<table>
						<tr>
							<td style="width: 80px;"><b>Cliente</b></td>
							<td><a href="javascript:adicionarCliente();">
								<input type="button" class="botao-adicionar" value="Adicionar"></a>
							</td>
							<td><html:errors property="cliente"></html:errors></td>
						</tr>
					</table>

					<!-- Combo Cliente -->

					<div id="dialog-confirm-cliente" title="Cliente" style="font-size: 0.8em">
						<html:select property="listaCliente" styleClass="combo-box" styleId="indice-cliente">
							<html:option value="-1">Selecione</html:option>
							<html:options collection="clientes" property="id" labelProperty="nomeFantasia" />
						</html:select>
							<a href="javascript:carregaCliente();">
							<input type="button" class="botao-adicionar" style="margin-top: 80px; float: right; margin-left: 5px;" value="Salvar"></a> 
							<a href="javascript:fechaCliente();">
							<input type="button" class="botao-cancelar" style="margin-top: 80px; float: right;" value="Cancelar"></a>
					</div>

					<!-- Formulário Cliente -->

					<table style="border-top-style: groove; padding-top: 10px; width: 100%;">

						<html:hidden property="cliente" styleId="idCliente" value="${client.id}" />

						<tr>
							<td style="width: 100px;">Fantasia:</td>
							<td>
								<html:text styleId="nomeFantasia" property="cliente" value="${client.nomeFantasia}" styleClass="cadastro-text-disabled" readonly="true" disabled="true"></html:text>
							</td>
						</tr>
						<tr>
							<td style="width: 100px;">Razão Social:</td>
							<td>
								<html:text styleId="razaoSocial" property="cliente" value="${client.razaoSocial}" styleClass="cadastro-text-disabled" readonly="true" disabled="true"></html:text>
							</td>
						</tr>

						<tr title="Pessoa Física" class="pessoaFisica">
							<td style="padding-right: 5px;">CPF</td>
							<td>
								<html:text styleId="cpf" property="cliente" value="${client.cpf}" styleClass="cadastro-text-disabled" readonly="true" disabled="true"></html:text>
							</td>
						</tr>
						
						<tr title="Pessoa Física" class="pessoaFisica">
							<td style="padding-right: 5px;">RG</td>
							<td><html:text styleId="rg" property="cliente" value="${client.rg}" styleClass="cadastro-text-disabled"
									readonly="true" disabled="true">
								</html:text></td>
						</tr>

						<tr title="Pessoa Jurídica" class="pessoaJuridica">
							<td style="padding-right: 5px;">CNPJ</td>
							<td><html:text styleId="cnpj" property="cliente" value="${client.cnpj}" styleClass="cadastro-text-disabled">
								</html:text></td>
						</tr>
						<tr title="Pessoa Jurídica" class="pessoaJuridica">
							<td style="padding-right: 5px;">IE</td>
							<td><html:select styleId="ie" property="cliente" value="${client.ie}" styleClass="cadastro-text-disabled">
									<html:option value="-1">Selecione</html:option>
								</html:select></td>
						</tr>

						<tr>
							<td style="padding-right: 5px;">Telefone:</td>
							<td><html:text styleId="telefone1" property="cliente" value="${client.telefone1}" styleClass="cadastro-text-disabled"
									readonly="true" disabled="true">
								</html:text></td>
						</tr>
						<tr>
							<td style="padding-right: 5px;">Celular:</td>
							<td><html:text styleId="celular" property="cliente" value="${client.celular}" styleClass="cadastro-text-disabled"
									readonly="true" disabled="true">
								</html:text></td>
						</tr>
					</table>
				</div>

					<!-- Chamada Forma de Pagamento -->
				<div id="tabs-2">
					<table style="height: 30px;">
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
						style="border-top-style: groove; padding-top: 10px; width: 100%; padding-bottom: 3px;">

						<html:hidden property="formaPagamento" styleId="idForma" value="${formaPagamento.id }" />

						<tr>
							<td style="width: 100px;">Pagamento:</td>
							<td>
								<html:text styleId="descricaoForma" property="formaPagamento" value="${formaPagamento.descricaoForma}" styleClass="cadastro-text-disabled" readonly="true"
									disabled="true">
								</html:text></td>
						</tr>
						<tr>
							<td style="width: 100px;">Parcelas:</td>
							<td><html:text styleId="parcelas" property="formaPagamento" value="${formaPagamento.parcelas}" styleClass="cadastro-text-disabled" readonly="true"
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
							<td><a href="javascript:adicionarProduto();">
								<input type="button" class="botao-adicionar" value="Adicionar"></a></td>
						</tr>
					</table>

					<table style="border-top-style: groove; border-spacing: 0px; border-collapse: collapse;">

						<html:hidden property="produto" styleId="idProduto" />

						<tr>
							<th style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Descrição</th>
							<th style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Volume</th>
							<th style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Valor Unitário</th>
							<th style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Quantidade</th>
							<th style="text-align: left; border-style: none; width: 150px; padding-top: 10px">Valor Total</th>
						</tr>
						
						<tr style="height: 5px;"><td></td></tr>

						<c:forEach var="produtoVenda" items="${produtoVenda}">
							<tr style="border: solid; border-width: thin; height: 30px;">
								<td style="width: 150px">${produtoVenda.produto.descricao}</td>
								<td style="width: 150px">${produtoVenda.produto.volume}</td>
								<td><div style="width: 150px">
									<fmt:formatNumber value="${produtoVenda.valor}" minFractionDigits="2" type="currency"/></div>
								</td>
								<td style="width: 150px">${produtoVenda.quantidade}</td>
								<td><div style="width: 150px">
									<fmt:formatNumber value="${produtoVenda.valor_total}" minFractionDigits="2" type="currency"/>
								</div>
								</td>
								<td style="border-style: none;">
									<a href="#" onclick="javascript:deletar(${produtoVenda.produto.id});">
									<img src="imgs/delete.png"></a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>

					<div id="botoes-pedido">
						<html:submit styleClass="botao-adicionar" value="Salvar" style="float: right"></html:submit>
						<input type="button" class="botao-cancelar" style="float: right" value="Cancelar" 
							onclick="javascript:document.location.href='lista-vendas.jsp;' ">
					</div>
				</div>
			
			</html:form>
		</div>

</body>
</html>