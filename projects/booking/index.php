<?php 

// On initialise la liste des pages accessibles depuis l'URL
$pages = array('accueil', 'erreur404');

// On vérifie si p est renseignée dans l'URL
if(isset($_GET['p'])) {

    // On récupère la page courante à l'aide de la variable d'URL "p", que l'on sécurise
    $currentPage = htmlentities(trim($_GET['p']));

    // On vérifie que p est bien une chaîne de caractères
    // et qu'elle est bien listée dans les pages autorisées (cf. $pages)
    if(is_string($currentPage) && in_array($currentPage, $pages)) {
    
        // On introduit le contrôleur lié à page en question
        require('app/controllers/'.$currentPage.'.php');

    } else {

        // On redirige l'utilisateur vers la page d'erreur 404, en précisant le nom de la page recherchée
        header('Location: index.php?p=erreur404&page='.$currentPage);

    }

} else { 

    // On redirige l'utilisateur vers la page d'accueil
    header('Location: index.php?p=accueil');

}

?>