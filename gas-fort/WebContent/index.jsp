<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />

</head>
<body>

	<div id="content-login" >
		
		<div id="dialog-form-2" style="border: 1px solid; border-color: #CD3700; border-radius: 1em; ">
			<html:form action="login" focus="login">
				<div style="text-align: center; width: 100%; margin-top: 15px;"><img src="imgs/slogan.jpg"></div>
				<br />
				<div style="float: left; margin-right: 15px; margin-left: 15px;">
					<img src="imgs/grupo_usuarios_novo.jpg">
				</div>
				<div style="overflow: auto; padding-top: 15px;">
					<div style="padding-bottom: 15px; color: #018C8F">
						<b>Usuário:</b>
						<html:text property="login" styleClass="caixa-login" />
						<html:errors property="login" />
					</div>
					<div style="padding-bottom: 15px; color: #018C8F">
						&nbsp;&nbsp;<b>Senha:</b>
						<html:password property="senha" styleClass="caixa-login" />
						<html:errors property="senha" />
						<html:errors property="dadosLogin" />
					</div>
					<html:submit styleClass="botao-cancelar" style="float: right; margin-right: 15px;">Entrar</html:submit>
					</div>
			</html:form>
			
		</div>

		<html:form action="/login" focus="login">

		</html:form>
	</div>
</body>
</html>