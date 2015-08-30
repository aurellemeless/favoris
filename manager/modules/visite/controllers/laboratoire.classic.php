<?php
/**
* @package   bos
* @subpackage visite
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class laboratoireCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='Données invalides';

    
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="laboratoire";
        return $rep;
    }


    
    function result(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="laboratoire_result";
        return $rep;
    }

    /**
    *
    */
    function read() {
        $rep = $this->getResponse('json');
        $page = $this->intParam('page',1,true);//$page
        $count = $this->intParam('count',10,true);//$count
        $filtre = $this->param('filter');
        $sorting = $this->param('sorting');
        $cb = $this->param('cb');
        $offset = ($page-1)*$count;
        // instanciation de la factory
        $tb=jDao::get('candidat');
        if(empty($cb)){

            $dt = new jDateTime();
            $filter = (array)json_decode($filtre);
            $sorting = (array)json_decode($sorting);
    //            $start = $this->adjust($start, '-',false);
    //            $end = $this->adjust($end, '-');
            $conditions=jDao::createConditions();
            //$conditions->addCondition('trashed','=','NO');
    //            $conditions->addCondition('createdate', '>=', $start);
    //            $conditions->addCondition('createdate', '<=', $end);
            foreach ($filter as $key => $value) {
                $conditions->addCondition($key,'LIKE','%'.$value.'%');
            }
            foreach ($sorting as $key => $value) {
                $conditions->addItemOrder($key, $value);
            } 
            $records = $tb->findBy($conditions,$offset,$count)->fetchAll();
            $rep->data['Items']= $records;

           
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
    function pending() {
        $rep = $this->getResponse('json');
         $page = $this->intParam('page',1,true);//$page
        $count = $this->intParam('count',10,true);//$count
        $filtre = $this->param('filter');
        $sorting = $this->param('sorting');
        $cb = $this->param('cb');
        $offset = ($page-1)*$count;
        // instanciation de la factory
        $tb=jDao::get('candidat');
        if(empty($cb)){

            $dt = new jDateTime();
            $filter = (array)json_decode($filtre);
            $sorting = (array)json_decode($sorting);
    //            $start = $this->adjust($start, '-',false);
    //            $end = $this->adjust($end, '-');
            $conditions=jDao::createConditions();
            $conditions->addCondition('creatinine','=',null);
    //            $conditions->addCondition('createdate', '>=', $start);
    //            $conditions->addCondition('createdate', '<=', $end);
            foreach ($filter as $key => $value) {
                $conditions->addCondition($key,'LIKE','%'.$value.'%');
            }
            foreach ($sorting as $key => $value) {
                $conditions->addItemOrder($key, $value);
            } 
            $records = $tb->findBy($conditions,$offset,$count)->fetchAll();
            $rep->data['Items']= $records;

           
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
    function finished() {
        $rep = $this->getResponse('json');
         $page = $this->intParam('page',1,true);//$page
        $count = $this->intParam('count',10,true);//$count
        $filtre = $this->param('filter');
        $sorting = $this->param('sorting');
        $cb = $this->param('cb');
        $offset = ($page-1)*$count;
        // instanciation de la factory
        $tb=jDao::get('candidat');
        if(empty($cb)){

            //$dt = new jDateTime();
            $filter = (array)json_decode($filtre);
            $sorting = (array)json_decode($sorting);
    //            $start = $this->adjust($start, '-',false);
    //            $end = $this->adjust($end, '-');
            $conditions=jDao::createConditions();
            $conditions->addCondition('creatinine','!=',null);
    //            $conditions->addCondition('createdate', '>=', $start);
    //            $conditions->addCondition('createdate', '<=', $end);
            foreach ($filter as $key => $value) {
                $conditions->addCondition($key,'LIKE','%'.$value.'%');
            }
            foreach ($sorting as $key => $value) {
                $conditions->addItemOrder($key, $value);
            } 
            $records = $tb->findBy($conditions,$offset,$count)->fetchAll();
            $rep->data['Items']= $records;

           
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
        $id=$this->intParam('id', 0, true);
        $creatinine=$this->param('creatinine');
        
        if($id){
            //update
            if(!empty($creatinine)){
                // instanciation de la factory
                $this->msg='resultat enregistré';
                // instanciation de la factory
                $tb = jDao::get("candidat");
                // creation d'un record correspondant au dao foo
                $record = $tb->get($id);
                // on remplit le record
                $record->creatinine = $creatinine;
                // on le sauvegarde dans la base
                $this->success=$tb->update($record);
                if($this->success)
                    $this->msg="resultat enregistré";
            }
        } 
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
   
}

