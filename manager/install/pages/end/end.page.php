<?php

/**
* page for Installation wizard
*
* @package     InstallWizard
* @subpackage  pages
* @author      Laurent Jouanneau
* @copyright   2010 Laurent Jouanneau
* @link        http://jelix.org
* @licence     GNU General Public Licence see LICENCE file or http://www.gnu.org/licenses/gpl.html
*/

class endWizPage extends installWizardPage {
    
    /**
     * action to display the page
     * @param jTpl $tpl the template container
     */
    function show ($tpl) {
        return false;
    }
    
    /**
     * action to process the page after the submit
     */
    function process() {
		/*
		if ($cnx = @mysql_connect ($host, $params['user'], $params['password'])) {
            if(!mysql_select_db ($params['database'], $cnx))
                throw new Exception($this->locales['error.no.database']);
            mysql_close($cnx);
        }
        else {
            throw new Exception($this->locales['error.no.connection']);
        }
		$file = jApp::configPath('profiles.ini.php');
		$ini = new jIniFileModifier($file);
		
		*/
		
        return 0;
    }

}