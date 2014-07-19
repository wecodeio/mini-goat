<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Listado de usuarios</title>
</head>
<body>

<form action="listado.do">
	<input name="filtro" value="${filtro}">
	<input type="submit" value="Consultar">
</form>

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
</body>
</html>