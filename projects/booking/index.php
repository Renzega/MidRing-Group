<?php 

// On initialise la liste des pages accessibles depuis l'URL
$pages = array('accueil', 'erreur404');

// On vérifie si p est renseignée dans l'URL, qu'elle est bien une chaîne de caractères
// et qu'elle est bien listée dans les pages autorisées (cf. $pages)
if(isset($_GET['p']) && is_string($_GET['p']) && in_array($_GET['p'], $pages)) {
    
    // On récupère la page courante à l'aide de la variable d'URL "p", que l'on sécurise
    $currentPage = htmlentities(trim($_GET['p']));
    
    // On introduit le contrôleur lié à page en question
    require('app/controllers/'.$currentPage.'.php');

} else { // Au moins une des conditions ci-dessus n'est pas respectée

    // On redirige l'utilisateur vers la page d'erreur 404, en précisant le nom de la page recherchée
    header('Location: index.php?p=erreur404&page='.$currentPage)

}

?>