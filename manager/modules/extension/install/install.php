<?php
/**
* @package   BOS
* @subpackage extension
* @author    your name
* @copyright 2015 BOS
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/


class extensionModuleInstaller extends jInstallerModule {

    function install() {
        //if ($this->firstDbExec())
        //    $this->execSQLScript('sql/install');

        /*if ($this->firstExec('acl2')) {
            jAcl2DbManager::addSubject('my.subject', 'extension~acl.my.subject', 'subject.group.id');
            jAcl2DbManager::addRight('admins', 'my.subject'); // for admin group
        }
        */
    }
}