<?php
mysql_connect("localhost", "root", "") or die("server error");
mysql_select_db("BD123456") or die("db error");

$numPermis = $_POST['numPermis'];
$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$R1 = $_POST['R1'];
$S1 = $_POST['S1'];

$req = "SELECT * FROM testeur WHERE numPermis = '$numPermis';";
$res = mysql_query($req);

if(mysql_fetch_array($res) == false){
	$req1 = "INSERT INTO testeur VALUES('$numPermis', '$nom', '$prenom', '$R1', $S1);";
	$res2 = mysql_query($req1);
	echo "Enregistrement fait avec succès";
} else {
	echo "Numéro de permis déjà existant";
}
	


?>