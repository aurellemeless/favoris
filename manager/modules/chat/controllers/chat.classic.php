<?php
/**
* @package   shopadmin
* @subpackage chat
* @author    aurelle meless
* @copyright 2015 aurelle meless
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class chatCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='ERREUR X1';

    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="list";
        return $rep;
    }
    function add(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="add";
        return $rep;
    }
    function detail(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="detail";
        return $rep;
    }
    /**
    *

    function read() {
        $rep = $this->getResponse('json');
        $liste=array();
        $id = $this->intParam('id',null,true);
        $cb = $this->intParam('cb',null,true);//$cb boolean
        // instanciation de la factory
        $cat= jDao::get("chat");
        if(empty($cb)){
            //liste pour datagrid
            // $chats = $tb->getNext($rows,$offset);
            $liste = $cat->findAll()->fetchAll();
            $rep->data["Items"] = $liste;
            $rep->data["Count"] = count($liste);
        }else {
            //liste pour combobox
            $rep->data = $cat->findAll();
        }

        return $rep;
    }
        */

    /**
    *
    */
    function read() {
        $rep = $this->getResponse('json');
        $page = $this->intParam('page',1,true);//$page
        $cb = $this->intParam('cb');//$page
        $count = $this->intParam('count',10,true);//$count
        $filtre = $this->param('filter');
        $sorting = $this->param('sorting');
        $offset = ($page-1)*$count;
        // instanciation de la factory
        $tb=jDao::get('message');
        if(empty($cb)){
            //$dt = new jDateTime();
            $filter = (array)json_decode($filtre);
            $sorting = (array)json_decode($sorting);
            $conditions=jDao::createConditions();
            foreach ($filter as $key => $value) {
                $conditions->addCondition($key,'LIKE','%'.$value.'%');
            }
            foreach ($sorting as $key => $value) {
                $conditions->addItemOrder($key, $value);
            }
            $rep->data['Items'] = $tb->findBy($conditions,$offset,$count)->fetchAll();
            $rep->data["Count"] = $tb->countBy($conditions);
        }else{
             $rep->data['Items'] = $tb->findAll()->fetchAll();
            $rep->data["Count"] = $tb->countAll();
         }
        return $rep;
    }

    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        $receiver_id=$this->intParam('receiver_id', 0, true);
        $content=$this->param('content', '', true);
            //insert
            if(!empty($content) && !empty($receiver_id) ){
                $this->msg='Message non envoyé';
                // instanciation de la factory
                $tb = jDao::get("message");
                // creation d'un record correspondant au dao foo
                $record = jDao::createRecord("message");
                // on remplit le record
                $record->receiver_id = $receiver_id;
                $record->sender_id = jAuth::getUserSession()->id;
                $record->content = $content;
                $dt = new jDateTime();
                $dt->now();
                $record->createdate = $dt->toString(jDateTime::DB_DTFORMAT); 
               // on le sauvegarde dans la base
                try{
                    $tb->insert($record);
                    $this->success=true;
                    $this->msg="Message envoyé ";
                }  catch (Exception $e){
                    $this->success=false;
                    $this->msg="Message non envoyé ";
                }


            }
      
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }

     /**
    *
    */

    function delete() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', null, true);
        $msg="Caractéristique non supprimé ";
        $success=0;

        if(!empty($id)){
                try{
                     // instanciation de la factory
                    $tb = jDao::get("chat");
                    $tb->delete($id);
                     $success=1;
                }  catch (Exception $e){
                    $success=0;
                }
                if($success)
                    $msg="Caractéristique supprimé ";
        }
        $rep->data=array('success'=>$success,'msg'=>$msg);
        return $rep;
    }
    
    function view() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', null, true);
        $this->success=FALSE;
        if(!empty($id)){
                try{
                     // instanciation de la factory
                    $tb = jDao::get("message");
                    $rep->data['item'] = $tb->get($id);
                      $this->success=true;
                }  catch (Exception $e){
                     $this->success=false;
                }
        }
       
        return $rep;
    }
    
    function opened() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', null, true);
        $this->success=TRUE;
        if(!empty($id)){
                try{
                     // instanciation de la factory
                    $tb = jDao::get("message");
                    $record = $tb->get($id);
                    $record->read = 1;
                    $tb->update($record);
                    $this->success=TRUE;
                }  catch (Exception $e){
                     $this->success=FALSE;
                }
        }
        $rep->data = array('success'=>  $this->success);
       
        return $rep;
    }
    

}
