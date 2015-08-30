<?php
/**
* @package   bos
* @subpackage user
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class featureCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='Données invalides';

    
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="feature";
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
        $tb=jDao::get('feature');
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
    function save() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', 0, true);
        $title=$this->param('title', '', true);
        $description=$this->param('description');
        
        if($id){
            //update
            if(!empty($title)){
                // instanciation de la factory
                $this->msg='featuree non  modifié';
                // instanciation de la factory
                $tb = jDao::get("feature");
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
                    $this->msg="featuree modifié";
            }
        } else {
            //insert
            if(!empty($title)){
                $this->msg='featuree non  ajouté';
                // instanciation de la factory
                $tb = jDao::get("feature");
                // creation d'un record correspondant au dao foo
                $record = jDao::createRecord("feature");
                // on remplit le record
                $record->title = $title;
                $record->description = $description;
                //$feature->icone = $this->saveIcon($icone,$title);
                // on le sauvegarde dans la base
                $this->success=$tb->insert($record);
                if($this->success)
                    $this->msg="featuree ajouté ";
            }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
   /**
    * 
    public function saveIcon($file,$file_title) {
        $rep_dest='images/icons/feature/';
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

