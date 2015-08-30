<?php
/**
* @package   BOS
* @subpackage bos
* @author    aurelle Meless
* @copyright 2015 BOS
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/

class installerCtrl extends jController {

     public $pluginParams = array('*'=>array('auth.required'=>false));

    /**
    *
    */
     function clean() {
        $rep = $this->getResponse('redirect');

        $this->deleteContent('install');
        @rmdir('install');
        @unlink('install.php');

        return $rep;
    }
   
   protected function deleteContent($path){
       try{
         $iterator = new DirectoryIterator($path);
         foreach ( $iterator as $fileinfo ) {
           if($fileinfo->isDot())continue;
           if($fileinfo->isDir()){
             if($this->deleteContent($fileinfo->getPathname()))
               @rmdir($fileinfo->getPathname());
           }
           if($fileinfo->isFile()){
             @unlink($fileinfo->getPathname());
           }
         }
       } catch ( Exception $e ){
          // write log
          return false;
       }
       return true;
    }

     
}

