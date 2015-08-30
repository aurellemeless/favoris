<?php
/**
* @package   BOS
* @subpackage bos
* @author    aurelle Meless
* @copyright 2015 BOS
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/

class defaultCtrl extends jController {
    /**
    *
    */
     function index() {
        $rootUrl =  jApp::config()->urlengine["basePath"];
        $rep = $this->getResponse('html');
        $rep->title='Tableau de bord '.$rep->appName;
        $tb = jDao::get('chat~message');
        $jsfiles = $this->extensionsFiles();
        $messages = $tb->findLatest(jAuth::getUserSession()->id)->fetchAll();
        $rep->body->assign('user',jAuth::getUserSession());
        $rep->body->assign('messages',  $messages);
        $rep->body->assign('menus',  $this->extensionsMenu());
        $rep->body->assign('js_bottom_files', $jsfiles['bottom']);
        $rep->body->assign('js_head_files', $jsfiles['head']);
        $rep->body->assign('rootUrl', $rootUrl);

        return $rep;
    }
    
    function dashboard() {
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname='dashboard';
        return $rep;
    }
    
    function about() {
        $rep = $this->getResponse('htmlfragment');
        $project= simplexml_load_file('project.xml');
        $version = $project->info->version->__toString();
        $date = $project->info->version['date']->__toString();
        $bos = array('version'=>$version, 'date'=> $date);
        $rep->tpl->assign('bos',$bos);
        $rep->tplname='about';
        return $rep;
    }
    
    
     function extensionsConfig() {
        $rep = $this->getResponse('js');
        $config=array();        
        $dir="modules/";
        //
        $iter = new DirectoryIterator($dir);  
        foreach($iter as $file ) {  
            if ( !$file->isDot() ) {
                if($file->isDir() && file_exists($dir.$file->getFilename().'/urls.json')){
                    $doc = jFile::read($dir.$file->getFilename().'/urls.json');
                    $urls = json_decode($doc);
                    foreach ($urls->config as $row) {
                        $config['config'][] = $row ;
                    }
                    foreach ($urls->modules as $row) {
                        $config['modules'][] = $row ;
                    }
                    
                } 
            }  
        } 
        $tpl = new jTpl();
        $tpl->assign('config', $config);
        $tpl->assign('rootUrl', jApp::config()->urlengine['basePath']);
        $content = $tpl->fetch('bos~init');
        $rep->data =  $content;
        return $rep;
    }
    
    protected function extensionsMenu() {
        $r=array();        
        $dir="modules/";
        $tpl = new jTpl();
        //
        $iter = new DirectoryIterator($dir);  
        foreach($iter as $file ) {  
            if ( !$file->isDot() ) {
                if($file->isDir() && file_exists($dir.$file->getFilename().'/templates/sidebar.tpl')){
                    //get the module xml file
                    $info= $file->getFilename().'~sidebar';
                    //jLog::dump($info);
                    $r[]= $tpl->fetch($info);
                } 
            }  
        }  
        return $r;
    }
    
    
     protected function extensionsFiles() {
        $config=array();        
        $dir="modules/";
        $tpl = new jTpl();
        //
        $iter = new DirectoryIterator($dir);  
        foreach($iter as $file ) {  
            if ( !$file->isDot() ) {
                if($file->isDir() && file_exists($dir.$file->getFilename().'/urls.json')){
                    //get the module xml file
                    $doc = jFile::read($dir.$file->getFilename().'/urls.json');
                    $urls = json_decode($doc);
                    
                    foreach ($urls->jsfiles->head as $row) {
                         $config['head'][] = jUrl::get('jelix~www:getfile', array('targetmodule'=>$file->getFilename(), 'file'=>$row));
                    }

                    foreach ($urls->jsfiles->bottom as $row) {
                         $config['bottom'][] = jUrl::get('jelix~www:getfile', array('targetmodule'=>$file->getFilename(), 'file'=>$row));
                    }

                } 
            }  
        }  
        
       
        return $config;
    }
}

