<?php
/**
* @package   bos
* @subpackage user
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class groupCtrl extends jController {
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
        $liste=array();
        // instanciation de la factory
        $tb= jDao::get("group");
        $liste = $tb->findAll()->fetchAll();
        $rep->data["Items"] = $liste;
        $rep->data["Count"] = $tb->countAll();
        
        return $rep;
    }
    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', 0, true);
        $title=$this->param('title', '', true);
        $description=$this->param('description');
        
        if($id){
            //update
            if(!empty($title)){
                // instanciation de la factory
                $this->msg='groupe non  modifié';
                // instanciation de la factory
                $tb = jDao::get("group");
                // creation d'un record correspondant au dao foo
                $record = $tb->get($id);
                // on remplit le record
                $record->title = $title;
                $record->description = $description;
                if (isset($_FILES['icone'])) {
                        $record->icone=$this->saveIcon($_FILES['icone'],$title);
                }
                // on le sauvegarde dans la base
                $this->success=$tb->update($record);
                if($this->success)
                    $this->msg="groupe modifié";
            }
        } else {
            //insert
            if(!empty($title)){
                $this->msg='groupe non  ajouté';
                // instanciation de la factory
                $tb = jDao::get("group");
                // creation d'un record correspondant au dao foo
                $record = jDao::createRecord("group");
                // on remplit le record
                $record->title = $title;
                $record->description = $description;
                //$group->icone = $this->saveIcon($icone,$title);
                // on le sauvegarde dans la base
                $this->success=$tb->insert($record);
                if($this->success)
                    $this->msg="groupe ajouté ";
            }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }

    /**
    *
    */
    function view() {
        $rep = $this->getResponse('json');
        $id = $this->intParam('id');
        try {
            $rep->data['row'] = jDao::get('group')->get($id);
            
        } catch (Exception $e) {
            $rep->data['row'] =  array();
        }
        
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

