/*
	File: fn_welcomeNotification.sqf

	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Bonjour %1, lisez-ceci, c'est important !",profileName] hintC
[
	"Bienvenue ! Certaines choses ont changé sur Altis Life et vous devez en être conscients !",
	"Un bouton interactif a été ajouté : par défaut c'est la touche WINDOWS. Vous pouvez changer cette touche en modifiant vos raccourcis : Configurer->Contrôles->Custom et lier une touche à (USE ACTION 10).",
	"Cette touche permet de :",
	"Prendre Objets & Monnaie",
	"Farmer & Pêcher",
	"Interfaction avec des Joueurs (Gendarme)",
	"Interaction avec les Véhicules (Réparations + Actions)",
	"Si vous avez des problèmes avec ces actions, patientez. Pour vérifier si vous pouvez prendre un objet à terre, vous pouvez utiliser votre touche (²) et utiliser le cercle pour surligner l'objet. Si vous arrivez à lire le nom de l'objet, cela veut dire que vous pouvez le prendre !"
];
