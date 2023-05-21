<?php
mysql_connect("localhost", "root", "") or die("server error");
mysql_select_db("BD123456") or die("db error");

$numPermis = $_POST['numPermis'];
$idModele = $_POST['S1'];
$dt = date('Y-m-d h:i:s');
$secur = $_POST['secur'];
$cond = $_POST['cond'];
$conf = $_POST['conf'];

$req1 = "SELECT * FROM testeur WHERE numPermis = '$numPermis';";
$res1 = mysql_query($req1);

if(mysql_fetch_array($res1) == false){
	echo "Testeur non inscrit";
} else {
	
	$req2 = "SELECT * FROM evaluation WHERE numPermis = '$numPermis' AND idModele = '$idModele';";
	$res2 = mysql_query($req2);

	if(mysql_fetch_array($res2) != false){
		echo "Vous avez déjà testé ce modèle";
	} else{
		
		$req3 = "INSERT INTO evaluation VALUES('$numPermis', $idModele, '$dt', $secur, $cond, $conf);";
		$res3 = mysql_query($req3);
		echo  "Evaluation enregistrée avec succès";
	}
}
	


?>