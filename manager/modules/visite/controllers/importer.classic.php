<?php
/**
* @package   bos
* @subpackage visite
* @author    aurelle meless
* @copyright 2015 bos
* @link      http://www.internet-aff.com
* @license    All rights reserved
*/

class importerCtrl extends jController {
    /**
    *
    */
    protected  $success=false;
    protected  $msg='Données invalides';

    
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="importer";
        return $rep;
    }

    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        
        if(isset($_FILES['candidats'])){
            $this->success = true;
            //get files
            $file_name = 'liste_candidats_'.uniqid();
            //$csv = new SplFileObject($this->saveFile($_FILES['candidats'],$file_name), 'r');
            $csv = new SplFileObject($_FILES['candidats']['tmp_name'],'r');
            $csv->setFlags(SplFileObject::READ_CSV) ;
            $csv->setCsvControl(';');
            $rows = array();
            $i = 0;
            
            foreach($csv as $ligne){
                
                $rows[$i] = $ligne;
                $i++;
                
            }
            // get header ( colonnes) : fields
             $indexMatricule = array_search('matricule', $rows[0]);
             jLog::dump($indexMatricule);
             $indexDdn = array_search('ddn', $rows[0]);
             $indexLn = array_search('ln', $rows[0]);
             $indexConcour = array_search('concour', $rows[0]);
             $indexCodebarre = array_search('codebarre', $rows[0]);
             $indexNom = array_search('nom', $rows[0]);
             $indexPrenom = array_search('prenom', $rows[0]);
             $indexDatevisite = array_search('datevisite', $rows[0]);
                // instanciation de la factory
                $tb = jDao::get("candidat");
                $cnx =  jDb::getConnection();
                $i=0;
                set_time_limit(60*60);
                foreach($csv as $ligne){

                    if($i > 0){

                        try {
                            $cnx->beginTransaction(); //i start la transaction
                            $record = jDao::createRecord("candidat");
                            // on remplit le record
                            $record->matricule = $ligne[$indexMatricule];
                            $record->ddn = $ligne[$indexDdn];
                            $record->ln = $ligne[$indexLn];
                            $record->concour = $ligne[$indexConcour];
                            $record->codedarre = $ligne[$indexCodebarre];
                            $record->nom = $ligne[$indexNom];
                            $record->prenom = $ligne[$indexPrenom];
                            $record->datevisite = $ligne[$indexDatevisite];
                            // on le sauvegarde dans la base
                            $tb->insert($record);
                            $cnx->commit();
                        } catch (Exception $e) {
                            $cnx->rollback();
                            $this->msg = "Des doublons ont été  detectés dans le fichier source et ignorés lors de l'operation";
                        }
                        

                    }
                    
                    $i++;
                
                }
                
            
        } 
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
    /**
    * */
    public function saveFile($file,$file_name) {
        $rep_dest='var/uploads/';
        $upload = new upload($file);
        $upload->file_overwrite=true;//supprime le fichier si existe
        if ($upload->uploaded) {
            //file
            $upload->file_new_name_body=$file_name;
            // It could be something like $upload->Process('www/my_uploads/');
            $upload->Process($rep_dest);
            //$upload->clean();
            return  $upload->file_dst_name;
        }
        return null;
    }
   
}

