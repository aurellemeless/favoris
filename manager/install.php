<?php
// for jelix application
require ('application.init.php');

require('lib/installwizard/installWizard.php');

$config = 'install/wizard.ini.php';

$install = new installWizard($config);

// for jelix application
$install->run(isAppInstalled());

//$install->run();
