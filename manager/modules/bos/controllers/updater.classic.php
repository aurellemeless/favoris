<?php
/**
* @package   BOS
* @subpackage extension
* @author    Aurelle Meless
* @copyright 2015 BOS
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/
require_once (JELIX_LIB_PATH.'installer/jInstaller.class.php');
define('UPDATE_URL','http://localhost/bos/');
class updaterCtrl extends jController {
    
    /**
     *
     * @var boolean 
     */
    protected  $success=false;
    /**
     *
     * @var string 
     */
    protected  $msg='Données invalides';
    /**
    *
    */
    function info() {
        $rep = $this->getResponse('json');
        $project= simplexml_load_file('project.xml');
        $rep->data = array('version'=>$project->info->version->__toString(),'date'=>$project->info->version['date']->__toString()); 
        return $rep;
    }
    
    function update() {
        $rep = $this->getResponse('json');
        $this->msg = 'Votre Version de Business Open Suite est déjà à jours';
        $project= simplexml_load_file('project.xml');
        $local_version = $project->info->version->__toString();
        $data = array('module'=>'bos','action'=>'updater:info');
        $bos_info = jHttp::quickPost(UPDATE_URL.'index.php',$data);
        $bos_info = json_decode($bos_info);
        if($bos_info->version !=  $local_version){
            $tempname = uniqid().'.zip';
            $bos = jHttp::quickGet(UPDATE_URL.'bos.zip');
            file_put_contents('var/uploads/'.$tempname, $bos);
            $this->unpackUpdate('var/uploads/'.$tempname);
            unlink('var/uploads/'.$tempname);
            $this->msg = 'votre version de Business Open Suite a été mise à jours';
            $this->success = true;
        }
       
        $rep->data = array('success'=>  $this->success,'msg'=>  $this->msg); 
        return $rep;
    }
    
    function unpackUpdate($file) {
        $zip = new ZipArchive;
        $zip->open($file);
        //$zip->extractTo(jApp::appPath());
        jLog::dump(jApp::appPath());
        $src = jApp::appPath().'var/uploads/'.uniqid();
        $zip->extractTo($src);
        //modules bos 
        copy($src.'/project.xml',  jApp::appPath().'project.xml');
        copy($src.'/responses/myHtmlResponse.class.php',  jApp::appPath().'responses/myHtmlResponse.class.php');
        copy($src.'/responses/myJsResponse.class.php',  jApp::appPath().'responses/myJsResponse.class.php');
        copy($src.'/modules/extension/',  jApp::appPath().'modules/extension/');
        copy($src.'/modules/user/',  jApp::appPath().'modules/user/');
        copy($src.'/modules/bos/',  jApp::appPath().'modules/bos/');
		copy($src.'/modules/chat/',  jApp::appPath().'modules/chat/');
        
    }
  
    
}

