<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Listado de usuarios</title>
<style type="text/css">

	input {
		font-size: 2em;
		width: 80%;
		float: left;
		line-height: 2em;
	}
	
	button {
		font-size: 2em;
		background-color: steelblue;
		color: white;
		padding: 0.5em;
		border: none;
		border-radius: 0.2em;
		width: 20%;
		float: left; 
	}
	.results {
		clear: both;
	}

</style>
</head>
<body>

<div>
	<form action="listado.do">
		<input name="filtro" value="${filtro}">
		<button type="submit">Consultar</button>
	</form>
</div>

<div class="results">
	<c:choose>
		<c:when test="${!usuarios.isEmpty()}">
			<ul>
			<c:forEach var="usuario" items="${usuarios}">
			   <li>${usuario}</li>
			</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			No hay usuarios que coincidan con ese criterio
		</c:otherwise>
</c:choose>
</div>
</body>
</html>