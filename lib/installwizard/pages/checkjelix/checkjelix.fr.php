<?php

$locales = array(

    'title'=>'Prerequis',
    'results'=>'Resultats',

       'checker.title'=>'Vérification de l\'installation de Jelix',
        'number.errors'         =>' erreurs.',
        'number.error'          =>' erreur.',
        'number.warnings'       =>' avertissements.',
        'number.warning'        =>' avertissement.',
        'number.notices'        =>' remarques.',
        'number.notice'         =>' remarque.',
        'build.not.found'       =>'Le fichier BUILD de jelix est introuvable',
        'conclusion.error'      =>'Vous devez corriger l\'erreur pour faire fonctionner correctement l\'application.',
        'conclusion.errors'     =>'Vous devez corriger les erreurs pour faire fonctionner correctement l\' application.',
        'conclusion.warning'    =>'L\'application peut à priori fonctionner, mais il est préférable de corriger l\'avertissement pour être sûr.',
        'conclusion.warnings'   =>'L\'application peut à priori fonctionner, mais il est préférable de corriger les avertissements pour être sûr.',
        'conclusion.notice'     =>'Les prerequis essentiels pour faire fonctionner l\'application sont ok malgré la remarque.',
        'conclusion.notices'    =>'Les prerequis essentiels pour faire fonctionner l\'application sont ok malgré les remarques.',
        'conclusion.ok'         =>'Les prerequis essentiels pour faire fonctionner l\'application sont ok',
        'cannot.continue'       =>'Les vérifications ne peuvent continuer : %s',
        'extension.not.installed'=>'L\'extension %s n\'est pas disponible',
        'extension.optional.not.installed'=>'L\'extension %s optionnelle n\'est pas disponible',
        'extension.required.not.installed'=>'L\'extension %s obligatoire n\'est pas disponible',
        'extension.installed'=>'L\'extension %s est disponible',
        'extension.optional.installed'=>'L\'extension %s optionnelle est disponible',
        'extension.required.installed'=>'L\'extension %s obligatoire est disponible',
        'extensions.required.ok'=>'Toutes les extensions PHP obligatoires sont disponibles',
        'extension.database.ok'=>'L\'application utilisera une base de données SQL',
        'extension.database.ok2'=>'L\'application pourra utiliser une base de données SQL',
        'extension.database.missing'=>'L\'application a besoin d\'une base de données SQL',
        'extension.database.missing2'=>'L\'application ne pourra pas utiliser de base de données SQL',
        'path.core'             =>'Le fichier init.php  de jelix ou le fichier application.ini.php de votre application n\'est pas chargé',
        'path.temp'             =>'Le repertoire temporaire n\'est pas accessible en écriture ou alors le chemin du répertoire temp n\'est pas configurée comme il faut',
        'path.log'              =>'Le repertoire var/log dans votre application n\'est pas accessible en écriture ou alors le chemin du répertoire de log n\'est pas configurée comme il faut',
        'path.var'              =>'Le chemin du répertoire var n\'est pas configuré correctement : ce répertoire n\'existe pas',
        'path.config'           =>'Le chemin du répertoire config n\'est pas configuré correctement : ce répertoire n\'existe pas',
        'path.www'              =>'Le chemin du répertoire www n\'est pas configuré correctement : ce répertoire n\'existe pas',
        'path.config.writable' =>'Le répertoire var/config n\'a pas les droits en écriture',
        'path.profiles.writable'=>'Le fichier profiles.ini.php n\'a pas les droits en écriture',
        'path.mainconfig.writable'=>'Le fichier mainconfig.ini.php n\'a pas les droits en écriture',        
        'path.installer.writable'=>'Le fichier installer.ini.php n\'a pas les droits en écriture',
        'path.custom.not.exists'=>'Le fichier %s n\'existe pas, ses droits ne peuvent être vérifiés',
        'path.custom.writable'=>'Le fichier %s n\'a pas les droits en écriture',
        'path.custom.ok'=>'Le fichier %s a les droits en écriture',
        'php.bad.version'       =>'Mauvaise version de PHP',
        'php.version.current'   =>'Version PHP courante : %s',
        'php.ok.version'        =>'La version PHP %s installée est correcte',
        'php.version.required'  =>'L\'application nécessite au moins PHP %s',
        'too.critical.error'    =>'Trop d\'erreurs critiques sont apparues. Corrigez les.',
        'config.file'           =>'La variable $config_file n\'existe pas ou le fichier qu\'elle indique n\'existe pas',
        'paths.ok'              =>'Les répertoires temp, log, var, config et www sont ok',
        'ini.magic_quotes_gpc'  =>'php.ini : l\'activation des magic quotes n\'est pas prise en charge par jelix. Vous devez les désactiver',
        'ini.magic_quotes_runtime'=>'php.ini : magic_quotes_runtime doit être à off',
        'ini.session.auto_start'=>'php.ini : session.auto_start doit être à off',
        'ini.safe_mode'         =>'php.ini : le safe_mode est obsolète et n\'est pas recommandé.',
        'ini.register_globals'  =>'php.ini : il faut désactiver register_globals, pour des raisons de sécurité et parce que cette option n\'est pas nécessaire.',
        'ini.asp_tags'          =>'php.ini : il est conseillé de désactiver asp_tags. Cette option n\'est pas nécessaire.',
        'ini.ok'                =>'Les paramètres de php sont ok',

        'module.unknown'        =>'Module inconnu',
        'module.circular.dependency'=>"Dépendance circulaire ! le composant %s ne peut être installé",
        'module.needed'         =>'Pour installer le module %s, ces modules doivent être présent : %s',
        'module.bad.jelix.version'=>'Le module %s necessite une autre version de jelix (%s - %s)',
        'module.bad.dependency.version'=>'Le module %s necessite une autre version du module %s (%s - %s)',
        'module.installer.class.not.found'=>'La classe d\'installation %s pour le module %s n\'existe pas',
        'module.upgrader.class.not.found'=>'La classe de mise à jour %s pour le module %s n\'existe pas',

        'install.entrypoint.start'  =>'Installation pour le point d\'entrée %s',
        'install.entrypoint.end'    =>'Tous les modules sont installés ou mis à jour pour le point d\'entrée %s',
        'install.entrypoint.bad.end'=>'Installation interrompue pour cause d\'erreurs pour le point d\'entrée %s',
        'install.entrypoint.installers.disabled'=>'Les scripts d\'installation et de mise à jour ne seront pas executés, ils sont désactivés dans la configuration.',

        'install.dependencies.ok'   =>'Toutes les dépendances des modules sont valides',
        'install.bad.dependencies'  =>'Il y a des erreurs dans les dépendances. Installation annulée.',
        'install.invalid.xml.file'  =>'Le fichier identité %s est invalide ou inexistant',

        'install.module.already.installed'  =>'Le module %s déjà installé',
        'install.module.installed'          =>'Le module %s est installé',
        'install.module.error'              =>'Une erreur est survenue durant l\'installation du module %s: %s',
        'install.module.check.dependency'   =>'Vérifie les dépendances du module %s',
        'install.module.upgraded'           =>'Le module %s est mis à jour à la version %s',


);
