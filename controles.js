
// Cette fonction permet de vérifier si le paramètre x est composé uniquement par des lettres alphabétiques
function uniquementLettres(x)
{
	x=x.toUpperCase()
    var i=0
    while (x.charAt(i)>="A" && x.charAt(i)<="Z" && i<x.length) 
				i++

	return i == x.length
}

function verifNumPermis(num){
	if (num.length != 8 || num.charAt(2) != "/"){
		alert("Le N° Permis Une chaîne de 8 caractères respectant le format suivant : xx/xxxxx (où chaque x représente un chiffre).");
		return false;
	}
	var i = 0;
	while(i < num.length){
		if (verifChiffres(num.charAt(i)) == false && i != 2){
			alert("Le N° Permis Une chaîne de 8 caractères respectant le format suivant : xx/xxxxx (où chaque x représente un chiffre).");
			return false;
		}
		i++;
	}
}

function verif1()
{	
	var numPermis = document.getElementById("numPermis").value   // pour récupérer la valeur du numéro du permis
	var nom = document.getElementById("nomPilote").value         // pour récupérer la valeur du nom du pilote
	var prenom = document.getElementById("prenomPilote").value   // pour récupérer la valeur du prenom du pilote
	
	// numPermis
	if (numPermis.length != 8 || numPermis.charAt(2) != "/"){
		alert("Le N° Permis Une chaîne de 8 caractères respectant le format suivant : xx/xxxxx (où chaque x représente un chiffre).");
		return false;
	}
	var i = 0;
	while(i < numPermis.length){
		if (verifChiffres(numPermis.charAt(i)) == false && i != 2){
			alert("Le N° Permis Une chaîne de 8 caractères respectant le format suivant : xx/xxxxx (où chaque x représente un chiffre).");
			return false;
		}
		i++;
	}
	
	// nom
	if ( !( uniquementLettres(nom) && nom.length >= 3  && nom.length <= 20 ) ){
		alert("Le Nom doit etre Une chaîne alphabétique ayant une longueur comprise entre 3 et 20.");
		return false;
	}
	
	
	// prenom
	if ( !( uniquementLettres(prenom) && prenom.length >= 3  && prenom.length <= 20 ) ){
		alert("Le Prenom doit etre Une chaîne alphabétique ayant une longueur comprise entre 3 et 20.");
		return false;
	}
	
	// genre
	var R1 = document.getElementsByClassName("R1");
		
	if (R1[0].checked){
		var genre = "Féminin";
	}
	else if (R1[1].checked){
		var genre = "Masculin";
	}
	else {
		alert("La sélection d’un genre est obligatoire.");
		return false;
	}
	
	var S1 = document.getElementById("S1").selectedIndex;
	if(S1 == 0){
		alert("La sélection d’une ville est obligatoire");
		return false;
	}
	
	
}



 
 
function verifChiffres(ch){
	if (ch == ""){
		return false;
	}
	var i = 0;
	while (i<ch.length){
		if (ch[i] < "0" || ch[i] > "9"){
			return false;
		}
		i++;
	}
	return true;
}






function verif2(){
	var numPermis = document.getElementById("numPermis").value;
	
	// numPermis
	if (numPermis.length != 8 || numPermis.charAt(2) != "/"){
		alert("Le N° Permis Une chaîne de 8 caractères respectant le format suivant : xx/xxxxx (où chaque x représente un chiffre).");
		return false;
	}
	var i = 0;
	while(i < numPermis.length){
		if (verifChiffres(numPermis.charAt(i)) == false && i != 2){
			alert("Le N° Permis Une chaîne de 8 caractères respectant le format suivant : xx/xxxxx (où chaque x représente un chiffre).");
			return false;
		}
		i++;
	}
	
	// modele testé
	var S1 = document.getElementById("S1").selectedIndex;
	if(S1 == 0){
		alert("La sélection d’un modèle est obligatoire.");
		return false;
	}
	
	
	var secur = document.getElementById("secur").value;
	var cond = document.getElementById("cond").value;
	var conf = document.getElementById("conf").value;
	
	if ( !(verifChiffres(secur) && (parseInt(secur) >= 1 && 5 >= parseInt(secur)) ) ){
		alert("note de Sécurité doit etre un entier entre 1 et 5.");
		return false;
	}
	
	if ( !(verifChiffres(cond) && (parseInt(cond) >= 1 && 5 >= parseInt(cond)) ) ){
		alert("note de Conduite doit etre un entier entre 1 et 5.");
		return false;
	}
	
	if ( !(verifChiffres(conf) && (parseInt(conf) >= 1 && 5 >= parseInt(conf)) ) ){
		alert("note de Confort doit etre un entier entre 1 et 5.");
		return false;
	}
	
	var robot = document.getElementById('robot').checked;
	
	if (robot == false){
		alert("La sélection de la case à cocher est obligatoire.");
		return false;
	}
}