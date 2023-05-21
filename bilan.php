<?php
mysql_connect("localhost", "root", "") or die("server error");
mysql_select_db("BD123456") or die("db error");
$req = "SELECT m.libelle, AVG(e.securite), AVG(e.conduite) , AVG(e.confort) , COUNT(*)
		FROM modelevoiture m, evaluation e 
		WHERE m.idModele  = e.idModele
		GROUP BY m.libelle;";
$res = mysql_query($req);

echo "<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style> <table style='width: 100%'>
	<tr>
		<td>Modèle</td>
		<td>Sécurité</td>
		<td>Conduite</td>
		<td>Confort</td>
		<td>Nbr tests</td>
	</tr>";
while($t = mysql_fetch_array($res)){
	echo "<tr><td>$t[0]</td><td>$t[1]</td><td>$t[2]</td><td>$t[3]</td><td>$t[4]</td></tr>";
}

echo "</table>";

?>