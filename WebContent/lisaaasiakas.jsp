<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Asiakashallinta - Lis�ys</title>
</head>
<body>
<form id="tiedot" action="lisaaasiakas" method="post">
	<table>
		<thead>	
			<tr>
				<th colspan="5" class="menucontainer"><a href="listaaasiakkaat.jsp" class="menuitem">Takaisin listaukseen</a></th>
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelinnumero</th>
				<th>S�hk�posti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="button" id="tallenna" value="Lis��" onclick="tarkasta()"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo" class="ilmo"></span>
</body>
<script>
function tarkasta(){
	if(document.getElementById("etunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Etunimi ei kelpaa!";
		return;
	}else if(document.getElementById("sukunimi").value.length<2){
		document.getElementById("ilmo").innerHTML="Sukunimi ei kelpaa!";
		return;
	}else if(document.getElementById("puhelin").value.length<5){
		document.getElementById("ilmo").innerHTML="Puhelinnumero ei kelpaa!";
		return;
	}else if(document.getElementById("sposti").value.length<3){
		document.getElementById("ilmo").innerHTML="S�hk�posti ei  kelpaa!";
		return;
	}
	//Tarkastetaan sy�tteet siivousfunktiolla, josta laitetaan korjatut arvot kenttiin
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	//L�hetet��n lomakkeen tiedot, eli lomake from, jonka id=tiedot
	//Kutsuu muutaasiakas endpointin post-metodia
	document.forms["tiedot"].submit();
}
//Siivousfunktio poistaa sy�tteist� merkkej�, joilla voisi toteuttaa esim. SQL injektion
function siivoa(teksti){
	teksti=teksti.replace("<","");
	teksti=teksti.replace(";","");
	teksti=teksti.replace("'","''");
	return teksti;
}
</script>
</html>