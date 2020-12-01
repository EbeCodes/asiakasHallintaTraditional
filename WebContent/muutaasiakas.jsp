<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Asiakashallinta - Muuta</title>
</head>
<body>
<form id="tiedot" action="muutaasiakas" method="post">
	<table>
		<thead>	
			<tr>
				<th colspan="6" class="menucontainer"><a href="listaaasiakkaat.jsp" class="menuitem">Takaisin listaukseen</a></th>
			</tr>		
			<tr>
				<th>ID</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelinnumero</th>
				<th>Sähköposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="asiakas_id" id="asiakas_id" value="<c:out value='${asiakas.asiakas_id}'/>" style="color: gray; background-color: rgb(220,220,220);" readonly></td>
				<td><input type="text" name="etunimi" id="etunimi" value="<c:out value='${asiakas.etunimi}'/>"/></td>
				<td><input type="text" name="sukunimi" id="sukunimi" value="<c:out value='${asiakas.sukunimi}'/>"/></td>
				<td><input type="text" name="puhelin" id="puhelin" value="<c:out value='${asiakas.puhelin}'/>"/></td>
				<td><input type="text" name="sposti" id="sposti" value="<c:out value='${asiakas.sposti}'/>"/></td> 
				<!-- Jos käyttäjä klikkaa muuta paniketta, suoritetaan tarkstusfunktio -->
				<td><input type="button" id="muuta" value="Muuta" onclick="tarkasta()"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo" class="ilmo"></span>
</body>
<script>
function tarkasta() {
	if(document.getElementById("etunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Etunimi ei kelpaa!";
		return;
	}else if(document.getElementById("sukunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Sukunimi ei kelpaa!";
		return;
	}else if(document.getElementById("puhelin").value.length<2){
		document.getElementById("ilmo").innerHTML="Puhelinnumero ei kelpaa!";
		return;
	}else if(document.getElementById("sposti").value.length<3){
		document.getElementById("ilmo").innerHTML="Sähköposti ei kelpaa!";
		return;
	}
	//Tarkastetaan syötteet siivousfunktiolla, josta laitetaan korjatut arvot kenttiin
	document.getElementById("asiakas_id").value=siivoa(document.getElementById("asiakas_id").value);
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	
	document.forms["tiedot"].submit();
}

//Siivousfunktio poistaa syötteistä merkkejä, joilla voisi toteuttaa esim. SQL injektion
function siivoa(teksti){
	teksti=teksti.replace("<","");
	teksti=teksti.replace(";","");
	teksti=teksti.replace("'","''");
	return teksti;
}

</script>
</html>