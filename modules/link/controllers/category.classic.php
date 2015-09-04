<?php
/**
* @package   link
* @subpackage link
* @author    Aurelle Meless
* @copyright 2015 your name
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class categoryCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='ERREUR X1';

    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="category";
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
        $tb=jDao::get('category');
        if(empty($cb)){
            $dt = new jDateTime();
            $filter = (array)json_decode($filtre);
            $sorting = (array)json_decode($sorting);
            $conditions=jDao::createConditions();
            foreach ($filter as $key => $value) {
                $conditions->addCondition($key,'LIKE','%'.$value.'%'); 
            }
            foreach ($sorting as $key => $value) {
                $conditions->addItemOrder($key, $value);
            }
            $records = $tb->findBy($conditions,$offset,$count)->fetchAll();
            $rep->data["Count"] = $tb->countBy($conditions);
            $rep->data['Items'] = $records;
        }else{
             $rep->data['Items'] = $tb->findAll()->fetchAll();
        }
        
        return $rep;
    }
    
    
    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', 0, true);
        $title=$this->param('title', '', true);
        //$description=$this->param('description', '', true);
        
        if($id){
            //update
            if(!empty($title)){
                // instanciation de la factory
                $this->msg='category non  modifiée';
                // instanciation de la factory
                $tb = jDao::get("category");
                // creation d'un record correspondant au dao foo
                $record = $tb->get($id);
                // on remplit le record
                $record->title = $title;
               
                // on le sauvegarde dans la base
                $this->success=$tb->update($record);
                if($this->success)
                    $this->msg="category modifiée";
            }
        } else {
            //insert
            if(!empty($title)){
                $this->msg='category non  ajoutée';
                // instanciation de la factory
                $tb = jDao::get("category");
                // creation d'un record correspondant au dao foo
                $record = jDao::createRecord("category");
                // on remplit le record
                $record->title = $title;
                //$record->description = $description;
               
                // on le sauvegarde dans la base
                try{
                    $tb->insert($record);
                    $this->success=true;
                    $this->msg="category ajoutée ";
                }  catch (Exception $e){
                    $this->success=false;
                    $this->msg="category non ajoutée ";
                }
               
                    
            }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
    
    
    function delete() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', null, true);
        $msg="ERREUR : category non supprimée ";
        $success=false;
        
        if(!empty($id)){
                try{
                     // instanciation de la factory
                    $tb = jDao::get("category");
                    $success = $tb->delete($id);
                }  catch (Exception $e){
                    $success=false;
                }
                if($success)
                    $msg="category  supprimée ";
        }
        $rep->data=array('success'=>$success,'msg'=>$msg);
        return $rep;
    }
    
}

