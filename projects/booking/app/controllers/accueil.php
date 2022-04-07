<?php

require_once('app/app_config.php');
require('app/tbs_engine/tbs_class.php');

$tbs = new clsTinyButStrong();

$tbs->loadTemplate(TEMPLATES_LOC."/accueil.php");
$homeMessage = "Bienvenue sur la page d'accueil !";
$tbs->Show();

?>