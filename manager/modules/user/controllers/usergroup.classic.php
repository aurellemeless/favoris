<?php
/**
* @package   bos
* @subpackage user
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class usergroupCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='Données invalides';

    
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="group";
        return $rep;
    }
    /**
    *
    */
    function read() {
        $rep = $this->getResponse('json');
        $group_id=$this->intParam('group_id', null, true);
        $user_id=$this->intParam('user_id', null, true);
        //$liste=array();
        // instanciation de la factory
        $tb= jDao::get("user_group");
        $cond = jDao::createConditions();
        if(!empty($user_id)){
            $cond->addCondition('user_id', '=', $user_id);
        }
        if(!empty($group_id)){
            $cond->addCondition('group_id', '=', $group_id);
        }
        $records = $tb->findBy($cond)->fetchAll();
        $rep->data["Items"] = $records;
        $rep->data["Count"] = $tb->countBy($cond);
        
        return $rep;
    }
    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        $group_id=$this->intParam('group_id', null, true);
        $user_id=$this->intParam('user_id', null, true);
        
        //insert
        if(!empty($user_id) && !empty($group_id)){
            
            // instanciation de la factory
            $tb = jDao::get("user_group");
            // creation d'un record correspondant au dao foo
            $record = jDao::createRecord("user_group");
            // on remplit le record
            $record->group_id = $group_id;
            $record->user_id = $user_id;
            //$group->icone = $this->saveIcon($icone,$title);
            try {
                $tb->insert($record);
                $this->success=true;
                $this->msg="groupe ajouté ";
            } catch (Exception $exc) {
                $this->success=false;
                $this->msg='groupe non  ajouté';
            }
                
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
    
   function delete() {
        $rep = $this->getResponse('json');
        $group_id=$this->intParam('group_id', null, true);
        $user_id=$this->intParam('user_id', null, true);
        
        if(!empty($group_id) && !empty($user_id)){
            // instanciation de la factory
            $tb = jDao::get("user_group");
            // creation d'un record correspondant au dao foo
            try{
                $tb->delete($user_id, $group_id);
                $this->success=true;
                $this->msg="groupe supprimé";
            }  catch (Exception $e){
                $this->success=false;
                $this->msg="groupe non supprimé";
            }
                 
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
   /**
    * 
    public function saveIcon($file,$file_title) {
        $rep_dest='images/icons/group/';
        jClasses::inc('man~upload');
        $upload = new upload($file);
        $upload->file_overwrite=true;//supprime le fichier si existe
        if ($upload->uploaded) {
            //file
            $upload->file_new_title_body=$file_title;
            // It could be something like $upload->Process('www/my_uploads/');
            $upload->Process($rep_dest);
            $upload->clean();
            return $upload->file_dst_title;
        }
        return null;
    }*/
}

