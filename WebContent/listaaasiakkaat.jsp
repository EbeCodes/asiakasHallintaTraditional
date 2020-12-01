<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Asiakashallinta - Listaus</title>
</head>
<body>
	<form action="haeasiakkaat" method="get">
		<table id="listaus">
			<thead>
				<tr>
					<th colspan="6" class="menucontainer"><a href="lisaaasiakas.jsp" class="menuitem">Lisää uusi asiakas</a></th>
				</tr>
				<tr>
					<th>Hakusana</th>
					<th colspan="2"><input type="text" name="hakusana" id="hakusana" value="${param['hakusana']}"></th>
					<th colspan="3"><input type="submit" value="hae" id="hakunappi"></th>
				</tr>
				<tr>
					<th>Asiakas_id</th>
					<th>Etunimi</th>
					<th>Sukunimi</th>
					<th>Puhelinnumero</th>
					<th>Sähköposti</th>
					<!-- Tyhjä solu muuta- ja poista-linkille -->
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${asiakkaat}" var="listItem">
					<tr>
						<td><c:out value="${listItem.asiakas_id}"/></td>
						<td><c:out value="${listItem.etunimi}"/></td>
						<td><c:out value="${listItem.sukunimi}"/></td>
						<td><c:out value="${listItem.puhelin}"/></td>
						<td><c:out value="${listItem.sposti}"/></td>
						<td><a href="muutaasiakas?asiakas_id=${listItem.asiakas_id}" class="muuta">muuta</a>
							<a onclick="varmista('${listItem.asiakas_id}')" class="poista">poista</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<script>
		//Kuunnellaan poista linkin klikkausta
		function varmista(asiakas_id) {
			if (confirm("Haluatko varmasti poistaa asiakkaan " + asiakas_id
					+ "?")) {
				document.location = "poistaasiakas?asiakas_id=" + asiakas_id;
			}
		}
	</script>
</body>	
</html>