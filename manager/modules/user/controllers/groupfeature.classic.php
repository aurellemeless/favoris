<?php
/**
* @package   bos
* @subpackage user
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class groupfeatureCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='Donnéees invalides';

    
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="groupfeature";
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
        $tb=jDao::get('group_feature');
        if(empty($cb)){

            $dt = new jDateTime();
            $filter = (array)json_decode($filtre);
            $sorting = (array)json_decode($sorting);
    //            $start = $this->adjust($start, '-',false);
    //            $end = $this->adjust($end, '-');
            $conditions=jDao::createConditions();
    //            $conditions->addCondition('createdate', '>=', $start);
    //            $conditions->addCondition('createdate', '<=', $end);
            foreach ($filter as $key => $value) {
                if($key=='group_id'){
                    $conditions->addCondition($key,'=',$value);
                }else{
                     $conditions->addCondition($key,'LIKE','%'.$value.'%');
                }
               
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
        $group_id=$this->param('group_id', '', true);
        $feature_id=$this->param('feature_id');
        
        //insert
        if(!empty($group_id) && !empty($feature_id)){
            // instanciation de la factory
            $tb = jDao::get("group_feature");
            // creation d'un record correspondant au dao foo
            $record = jDao::createRecord("group_feature");
            // on remplit le record
            $record->group_id = $group_id;
            $record->feature_id = $feature_id;
            //$groupfeature->icone = $this->saveIcon($icone,$group_id);
            // on le sauvegarde dans la base
            try{
                $tb->insert($record);
                 $this->success= true;
                 $this->msg='fonctionnalité ajoutée';
            }  catch (Exception $e){
                $this->msg='fonctionnalité non  ajoutée';
                $this->success= false;
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
        $group_id=$this->param('group_id',null, true);
        $feature_id=$this->param('feature_id');
        //insert
        if(!empty($group_id) && !empty($feature_id)){
            // instanciation de la factory
            $tb = jDao::get("group_feature");
            try{
                $tb->delete($group_id, $feature_id);
                 $this->success= true;
                 $this->msg='fonctionnalité retirée';
            }  catch (Exception $e){
                $this->msg='fonctionnalité non  retirée';
                $this->success= false;
            }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
   /**
    * 
    public function saveIcon($file,$file_group_id) {
        $rep_dest='images/icons/groupfeature/';
        jClasses::inc('man~upload');
        $upload = new upload($file);
        $upload->file_overwrite=true;//supprime le fichier si existe
        if ($upload->uploaded) {
            //file
            $upload->file_new_group_id_body=$file_group_id;
            // It could be something like $upload->Process('www/my_uploads/');
            $upload->Process($rep_dest);
            $upload->clean();
            return $upload->file_dst_group_id;
        }
        return null;
    }*/
}

