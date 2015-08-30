<?php
/**
* @package   shop
* @subpackage link
* @author    your name
* @copyright 2015 NUMERIKA GROUP
* @link      http://www.theindice.com 
* @license    All rights reserved
*/


class linkModuleInstaller extends jInstallerModule {

    function install() {
        //if ($this->firstDbExec())
        //    $this->execSQLScript('sql/install');

        /*if ($this->firstExec('acl2')) {
            jAcl2DbManager::addSubject('my.subject', 'link~acl.my.subject', 'subject.group.id');
            jAcl2DbManager::addRight('admins', 'my.subject'); // for admin group
        }
        */
    }
}