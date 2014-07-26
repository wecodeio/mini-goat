<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Luis Su�rez, exclusivo</title>
<style type="text/css">
.container {
	width: 50%;
	margin-left: 25%;
}

textarea {
	width: 100%;
	display: block;
	resize: none;
	height: 8em;
}

blockquote {
	border-left: 1px solid black;
	padding-left: 1em;
}

button {
	font-size: 1em;
	background-color: steelblue;
	color: white;
	padding: 0.5em;
	border: none;
	border-radius: 0.2em;
	float: right;
}
</style>
</head>
<body>

	<div class="container">
		<article class="nota">
			<h1>Luis Su�rez, exclusivo: "Todav�a no puedo tragar la decisi�n
				de la Fifa"</h1>
			<p>El futbolista Luis Su�rez recibe a BarcelonaWeb en el coqueto
				piso que posee en pleno centro de Montevideo. Las paredes est�n
				atestadas de vitrinas con trofeos y de fotos de sus diferentes
				etapas como jugador. Tambi�n se ven, enmarcadas, algunas camisetas
				de f�tbol que ha vestido. Sentado en un amplio sill�n de cuero,
				Su�rez bebe una infusi�n de una especie de calabaza, sorbi�ndola
				mediante un tubito plateado que tiene uno de sus extremos hundido en
				la materia org�nica verdosa y h�meda que colma el recipiente. Cada
				tanto, de manera maquinal, toma un cilindro met�lico que hay sobre
				la mesa ratona, lo destapa y lo inclina sobre la peque�a calabaza:
				del cilindro, que tiene el tama�o de un termo de los que se usan
				para tomar mate, mana un l�quido transparente que parece agua. Se lo
				ve abatido (a Su�rez, no al inanimado cilindro). Su rostro exhibe
				tristeza y quiz� algo de bronca. Ha quedado afuera de la Copa del
				Mundo Brasil 2014, inhabilitado por la Fifa para jugar durante
				cuatro meses debido al mordisco que le propin� a un adversario.</p>
		</article>
		<section class="comentarios">
			<form action="comentar.do">
				<input type="hidden" value="1" name="id" />
				<textarea name="comentario"></textarea>
				<button type="submit">Publicar comentario</button>
			</form>
			<h2>Comentarios</h2>
			<c:choose>
				<c:when test="${!comentarios.isEmpty()}">
					<c:forEach var="comentario" items="${comentarios}">
						<blockquote>${comentario}</blockquote>
					</c:forEach>
				</c:when>
				<c:otherwise>
					No hay comentarios para esta nota
				</c:otherwise>
			</c:choose>
		</section>
	</div>
</body>
</html>