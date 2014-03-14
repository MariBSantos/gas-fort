<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>LinQgaz</title>
<link rel="shortcut icon" href="imgs/metro.ico" />

<link type="text/css" href="css/gas-fort.css" rel="stylesheet" />

</head>

<body>
	<div id="image">
			<img src="imgs/logo.jpg" align="right" style="padding-right: 15px; padding-top: 5px;">
	</div>
	<div id="usuario">
		Olá, ${user.nome} | <a href="logout.do">Sair</a>
	</div>
	<div id="logos"></div>
</body>
</html>