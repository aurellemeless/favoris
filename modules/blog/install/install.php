<?php
/**
* @package   shop
* @subpackage blog
* @author    your name
* @copyright 2015 NUMERIKA GROUP
* @link      http://www.numerika-group.com 
* @license    All rights reserved
*/


class blogModuleInstaller extends jInstallerModule {

    function install() {
        //if ($this->firstDbExec())
        //    $this->execSQLScript('sql/install');

        /*if ($this->firstExec('acl2')) {
            jAcl2DbManager::addSubject('my.subject', 'blog~acl.my.subject', 'subject.group.id');
            jAcl2DbManager::addRight('admins', 'my.subject'); // for admin group
        }
        */
    }
}