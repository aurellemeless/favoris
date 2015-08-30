<?php
/**
* @package   bos
* @subpackage user
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class paramCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='Données invalides';

    
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="param";
        $app=$this->param('app', null, true);
        $tb= jDao::get("param");
        $conditions = jDao::createConditions();
        if(!empty($app)){
            $conditions->addCondition('app', '=', $app);
        }
        $config = $tb->findBy($conditions)->fetch();
        $rep->tpl->assign('config', $config);
        return $rep;
    }
    
    function module(){
        $rep = $this->getResponse('htmlfragment');
        $app=$this->param('app', null, true);
        jLog::dump($app);
        $rep->tplname=$app."~param";
        $tb= jDao::get("param");
        $conditions = jDao::createConditions();
        if(!empty($app)){
            $conditions->addCondition('app', '=', $app);
        }
        $config = $tb->findBy($conditions)->fetch();
        $rep->tpl->assign('config', $config);
        return $rep;
    }
    
    /**
    *
    */
    function read() {
        $rep = $this->getResponse('json');
        $app=$this->param('app', null, true);
        $tb= jDao::get("param");
        $conditions = jDao::createConditions();
        if(!empty($app)){
            $conditions->addCondition('app', '=', $app);
            $t = $tb->countBy($conditions);
            if($t == 0){
                $record = jDao::createRecord("param");
                $record->app = $app;
                $record->params = null;
                $record->user_id = jAuth::getUserSession()->id;
                $tb->insert($record);
            }
           
        }
        $record = $tb->findBy($conditions)->fetch();
        $record->params = (object)json_decode($record->params);
        $rep->data = $record;
        
        return $rep;
    }
    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', 0, true);
        $app=$this->param('app', '', true);
        $params=$this->param('params');
        if($id){
            //update
            if(!empty($app)){
                // instanciation de la factory
                $this->msg='paramètres non  modifié';
                // instanciation de la factory
                $tb = jDao::get("param");
                // creation d'un record correspondant au dao foo
                $record = $tb->get($id);
                // on remplit le record
                $record->app = $app;
                $record->params = $params;
                // on le sauvegarde dans la base
                $this->success=$tb->update($record);
                if($this->success)
                    $this->msg="paramètres modifié";
            }
        }
        
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
}

