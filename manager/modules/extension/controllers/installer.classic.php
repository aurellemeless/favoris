<?php
/**
* @package   BOS
* @subpackage extension
* @author    your name
* @copyright 2015 BOS
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/
require_once (JELIX_LIB_PATH.'installer/jInstaller.class.php');
class installerCtrl extends jController {
    /**
     * core modules
     * 
     * @var array
     */
    protected $core = array('','bos','extension','user','chat');
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
    function index() {
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname = 'installer';
        return $rep;
    }
    
    function read() {
        $rep = $this->getResponse('json');
        $rep->data['Items'] = array();        
        $dir="modules/";
        //
        $iter = new DirectoryIterator($dir);  
        foreach($iter as $file ) {  
            if ( !$file->isDot() ) {
                if($file->isDir() && !array_search($file, $this->core)){
                    //get the module xml file
                    $info= simplexml_load_file($dir.$file->getFilename().'/module.xml');
                    $data = json_encode($info);
                    $proper = str_replace('@', '', $data);
                    $rep->data['Items'][] = (array) json_decode($proper);
                } 
            }  
        }  
        return $rep;
    }
    function allModules() {
        $r=array();        
        $dir="modules/";
        //
        $iter = new DirectoryIterator($dir);  
        foreach($iter as $file ) {  
            if ( !$file->isDot() ) {
                if($file->isDir()){
                    //get the module xml file
                    $info= simplexml_load_file($dir.$file->getFilename().'/module.xml');
                    $r[]= $info;
                } 
            }  
        }  
        return $r;
    }
    function install() {
        $rep = $this->getResponse('json');
       
        $this->msg="installation échouée";
        if(isset($_FILES["archive"])){
            $rep_dest="var/uploads/";
            $upload = new upload($_FILES["archive"]);
            $upload->file_overwrite=true;//supprime le file si existe
            $upload->allowed=array('application/zip');
            if ($upload->uploaded) {
                // It could be something like $upload->Process('www/my_uploads/');
                $upload->Process($rep_dest);
                //extraction de larchive
                $zip = new ZipArchive;
                $zip->open($upload->file_dst_pathname);
                //
                if(!$zip->getFromName('module.xml')){//if module file doesnt exists
                    $this->msg="installation échouée: fichier d'installation absent";
                } else {
                    $moduleXml= simplexml_load_string($zip->getFromName('module.xml'));
                    //verifiying the compatibility with jelix core version
                    if($this->compatibility($moduleXml->dependencies->jelix)){
                        $zip->extractTo('modules/'.$moduleXml->info['name'].'/');//we extract to module directory
                        $this->setConfig($moduleXml->info['name']);//set module config
                        $this->installScript($moduleXml->info['name']);
                        //$this->showOnMenu($moduleXml->info['name']);
                        $this->msg="module installé";
                        $this->success = true;
                    }else{
                        $this->success = false;
                        $this->msg="module non installé : versions non compatibles";
                    }
                    
                } 
                $zip->close(); //close archive
                $upload->clean();//clean server temp
                unlink($upload->file_dst_pathname);//clean second app temp
            }
        }
        $rep->data = array('success'=>  $this->success, 'msg'=>  $this->msg);
        return $rep;
    }
    /**
     * 
     * @param string $module the module name
     */
    function setConfig($module,$level=2) {
        $info= simplexml_load_file('modules/'.$module.'/module.xml');
        //edit default config
        $defaultConfig = jApp::configPath('mainconfig.ini.php');
        $ini = new jIniFileModifier ($defaultConfig);
        $ini->setValue($module.'.access',$level,'modules');
        $ini->save();
        $ep=$ini->getValue("defaultEntrypoint","urlengine");
        //edit installer file
        $installerConfig = jApp::configPath('installer.ini.php');
        $ini = new jIniFileModifier ($installerConfig);
        $ini->setValue($module.'.installed',1,$ep);
        $ini->setValue($module.'.version',$info->info->version,$ep);
        $ini->save();
        //entry point file
        //only for index
        $epConfig = jApp::configPath($ep.'/config.ini.php');
        $ini = new jIniFileModifier ($epConfig);
        $ini->setValue($module.'.access',$level,'modules');
        $ini->save();
    }
    
    function removeConfig($module) {
        //edit default config
        $defaultConfig = jApp::configPath('mainconfig.ini.php');
        $ini = new jIniFileModifier ($defaultConfig);
        $ini->removeValue($module.'.access','modules');
        $ini->save();
        $ep=$ini->getValue("defaultEntrypoint","urlengine");
        //edit installer file
        $installerConfig = jApp::configPath('installer.ini.php');
        $ini = new jIniFileModifier ($installerConfig);
        $ini->removeValue($module.'.installed',$ep);
        $ini->removeValue($module.'.version',$ep);
        $ini->save();
        //entry point file
        //only for index
        $epConfig = jApp::configPath($ep.'/config.ini.php');
        $ini = new jIniFileModifier ($epConfig);
        $ini->removeValue($module.'.access','modules');
        $ini->save();
    }
    function uninstall() {
        $rep = $this->getResponse('json');
        //$rep->addJSLink('monscript.js');
        $module=  $this->param("app");
        if (!empty($module)) {
            $base="modules/";
            $d=0;
            $config=  parse_ini_file('var/config/mainconfig.ini.php');
            if($config['startModule']!=$module){
                $this->uninstallScript($module);
                jFile::removeDir($base.'/'.$module);
                $this->removeConfig($module);
                $this->msg ="module desinstallé";
                $this->success = true;
            } else {
                $d=1;
                $this->msg ="le module par defaut ne peut etre desinstallé";
                $this->success = false;
            }
        }
        
        $moduleDir=  $this->allModules();
        $rep->data = array('success'=>  $this->success, 'msg'=>  $this->msg);
        return $rep;
    }
    protected function compatibility($modVersion) {
        $r=false;
        
        $projectXml=  simplexml_load_file('project.xml');
        $modMax=$this->numerize($modVersion['maxversion']);
        $jelixMin=  $this->numerize($projectXml->dependencies->jelix['minversion']);
        $jelixMax=$this->numerize($projectXml->dependencies->jelix['maxversion']);
        if(($modMax>=$jelixMin) && ($modMax<=$jelixMax)){
            $r=true;
        }
        return $r;
    }
    protected function numerize($string) {
        $string=str_replace('.','', $string);
        $string=str_replace('*','9', $string);
        return (int)$string;
    }
    protected function installScript($module) {
       $app=$module.'ModuleInstaller';//compose the class name
       $installer='modules/'.$module.'/install/install.php';//installer file location
       if(is_file($installer)){
           include_once $installer;
           $script=new $app();
           $script->install();
       }      
    }
    protected function uninstallScript($module) {
       $app=$module.'ModuleInstaller';//compose the class name
       $installer='modules/'.$module.'/install/install.php';//installer file location
       if(is_file($installer)){
           include_once $installer;
           $script=new $app();
           $script->uninstall();
       }      
    }
    
}

