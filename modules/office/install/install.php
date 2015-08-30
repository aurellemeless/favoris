<?php
/**
* @package   school
* @subpackage office
* @author    your name
* @copyright 2011 internet-aff
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/


class officeModuleInstaller extends jInstallerModule {

    function install() {
        $this->config->setValue('csv', "office~jResponseCsv", "responses");
        $this->config->setValue('csv', "office~jResponseCsv", "_coreResponses");
		$this->config->setValue('html2pdf', "office~jResponseHtml2Pdf", "responses");
        $this->config->setValue('html2pdf', "office~jResponseHtml2Pdf", "_coreResponses");
        //if ($this->firstDbExec())
        //    $this->execSQLScript('sql/install');

        /*if ($this->firstExec('acl2')) {
            jAcl2DbManager::addSubject('my.subject', 'office~acl.my.subject', 'subject.group.id');
            jAcl2DbManager::addRight('admins', 'my.subject'); // for admin group
        }
        */
    }
}