<?php
/**
* @package   bos
* @subpackage user
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class roleCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='Données invalides';

    
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="role";
        return $rep;
    }
    /**
    *
    */
    function read() {
        $rep = $this->getResponse('json');
        $liste=array();
        // instanciation de la factory
        $tb= jDao::get("role");
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
        $code=$this->param('code', '', true);
        $description=$this->param('description');
        
        if($id){
            //update
            if(!empty($title)){
                // instanciation de la factory
                $this->msg='rolee non  modifié';
                // instanciation de la factory
                $tb = jDao::get("role");
                // creation d'un record correspondant au dao foo
                $record = $tb->get($id);
                // on remplit le record
                $record->title = $title;
                $record->code = $code;
                $record->description = $description;
                if (isset($_FILES['icone'])) {
                        $record->icone=$this->saveIcon($_FILES['icone'],$title);
                }
                // on le sauvegarde dans la base
                $this->success=$tb->update($record);
                if($this->success)
                    $this->msg="rolee modifié";
            }
        } else {
            //insert
            if(!empty($title)){
                $this->msg='rolee non  ajouté';
                // instanciation de la factory
                $tb = jDao::get("role");
                // creation d'un record correspondant au dao foo
                $record = jDao::createRecord("role");
                // on remplit le record
                $record->title = $title;
                $record->code = $code;
                $record->description = $description;
                //$role->icone = $this->saveIcon($icone,$title);
                // on le sauvegarde dans la base
                $this->success=$tb->insert($record);
                if($this->success)
                    $this->msg="rolee ajouté ";
            }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
    
     function delete() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', 0, true);
        
        if(!empty($id)){
            // instanciation de la factory
            $tb = jDao::get("role");
            // creation d'un record correspondant au dao foo
            try{
                $tb = jDao::get("role");
                $tb->delete($id);
                $this->success=true;
                $this->msg="role modifié";
            }  catch (Exception $e){
                $this->success=false;
                $this->msg="role non modifié";
            }
                 
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
   /**
    * 
    public function saveIcon($file,$file_title) {
        $rep_dest='images/icons/role/';
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

