<?php
/**
* @package   df
* @subpackage link
* @author    Aurelle Meless
* @copyright 2015 your name
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class linkCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='ERREUR X1';

    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="link";
        return $rep;
    }
    
    function add(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="link_add";
        return $rep;
    }

    /**
    *
    */
    function read() {
        $rep = $this->getResponse('json');
        $liste=array();
       $page = $this->intParam('page',1,true);//$page
        $count = $this->intParam('count',10,true);//$count
        $filtre = $this->param('filter');
        $sorting = $this->param('sorting');
        $offset = ($page-1)*$count;
        // instanciation de la factory
        $tb=jDao::get('link');
        $dt = new jDateTime();
        $filter = (array)json_decode($filtre);
        $sorting = (array)json_decode($sorting);
        $conditions=jDao::createConditions();
        $conditions->addCondition('user_id', '=',  jAuth::getUserSession()->id);
        foreach ($filter as $key => $value) {
            $conditions->addCondition($key,'LIKE','%'.$value.'%'); 
        }
        foreach ($sorting as $key => $value) {
            $conditions->addItemOrder($key, $value);
        }
        $records = $tb->findBy($conditions,$offset,$count)->fetchAll();
        $rep->data["Count"] = $tb->countBy($conditions);
        $rep->data['Items'] = $records;
        
        return $rep;
    }
    
    
    /**
    *
    */
    function create() {
        $rep = $this->getResponse('json');
        $category_id=$this->intParam('category_id',null, true);
        $title=$this->param('title', '', true);
        $url=$this->param('url', '', true);
        //$description=$this->param('description', '', true);
        //insert
        if(!empty($url) && !empty($title) && !empty($category_id)){
            $this->msg='link non  ajouté';
            // instanciation de la factory
            $tb = jDao::get("link");
            // creation d'un record correspondant au dao foo
            $record = jDao::createRecord("link");
            // on remplit le record
            $record->title = $title;
            $record->url = $url;
            $record->category_id = $category_id;
            $record->user_id = jAuth::getUserSession()->id;
            // on le sauvegarde dans la base
            try{
                $tb->insert($record);
                $this->success=true;
                $this->msg="Lien ajouté ";
            }  catch (Exception $e){
                $this->success=false;
                $this->msg="lien non ajouté ";
            }
        }
        
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
    /**
    *
    */
    function update() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', 0, true);
        $title=$this->param('title', '', true);
        //$description=$this->param('description', '', true);
        
        if($id){
            //update
            if(!empty($title)){
                // instanciation de la factory
                $this->msg='link non  modifiée';
                // instanciation de la factory
                $tb = jDao::get("link");
                // creation d'un record correspondant au dao foo
                $record = $tb->get($id);
                // on remplit le record
                $record->title = $title;
               
                // on le sauvegarde dans la base
                $this->success=$tb->update($record);
                if($this->success)
                    $this->msg="link modifiée";
            }
        } else {
            //insert
            if(!empty($title)){
                $this->msg='link non  ajoutée';
                // instanciation de la factory
                $tb = jDao::get("link");
                // creation d'un record correspondant au dao foo
                $record = jDao::createRecord("link");
                // on remplit le record
                $record->title = $title;
                //$record->description = $description;
               
                // on le sauvegarde dans la base
                try{
                    $tb->insert($record);
                    $this->success=true;
                    $this->msg="link ajoutée ";
                }  catch (Exception $e){
                    $this->success=false;
                    $this->msg="link non ajoutée ";
                }
               
                    
            }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
    
    
    function delete() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', null, true);
        $msg="ERREUR : link non supprimée ";
        $success=false;
        
        if(!empty($id)){
                try{
                     // instanciation de la factory
                    $tb = jDao::get("link");
                    $success = $tb->delete($id);
                }  catch (Exception $e){
                    $success=false;
                }
                if($success)
                    $msg="link  supprimée ";
        }
        $rep->data=array('success'=>$success,'msg'=>$msg);
        return $rep;
    }
    
    function view() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', null, true);
       
        try{
             // instanciation de la factory
            $tb = jDao::get("link");
            $rep->data['row'] = $tb->get($id);
        }  catch (Exception $e){
            $rep->data['row']=array();
        }
                
        return $rep;
    }
    
}

