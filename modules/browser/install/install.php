<?php
/**
* @package   df
* @subpackage browser
* @author    your name
* @copyright 2015 SurfMaker 
* @link      http://www.theindice.com 
* @license    All rights reserved
*/


class browserModuleInstaller extends jInstallerModule {

    function install() {
        //if ($this->firstDbExec())
        //    $this->execSQLScript('sql/install');

        /*if ($this->firstExec('acl2')) {
            jAcl2DbManager::addSubject('my.subject', 'browser~acl.my.subject', 'subject.group.id');
            jAcl2DbManager::addRight('admins', 'my.subject'); // for admin group
        }
        */
    }
}