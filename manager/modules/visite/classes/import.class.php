<?php

/**
 * Classe importation de donnees dynamiques d'examens
 * @copyright SOFTECH 2014
 * @author Aurelle Meless
 */

class import {
    
     public function getRows($chemin) {
        //jLog::dump($chemin);
        $csv = new SplFileObject($chemin, 'r');
        $csv->setFlags(SplFileObject::READ_CSV) ;
        $csv->setCsvControl(',');
        $rows = array();
        $i = 0;
        
        foreach($csv as $ligne){
            
            $rows[$i] = $ligne;
            $i++;
            
        }
        
        return $rows;
    }
    
    function save($file,$fiche_id) {
        
        $tb=jDao::get('adminsys~fiche');
        $champs=$tb->findChamps($fiche_id);
        $chemin = $this->saveFile($file);
        $rows = $this->getRows($chemin);
        $r = $this->saveData($champs, $rows);
        return $r;
        
    }
    
    public function saveData($champs,$rows){
        $s=false;
        $ir = array_search('ID Patient', $rows[0]);
        $reception_id = $rows[1][$ir];
        //
        foreach ($champs as $c){
            $valeur = '';
            $index = array_search($c->importation, $rows[0]);
            
            if($index){
                
                $valeur = $rows[1][$index];
                
                if(strpos($c->importation, "10^(-1)")){
                    
                    $valeur = (float)$valeur;
                    $valeur = $valeur * 0.1;
                    
                }
                
            }else{
                $valeur = 0;
            }
                 // instanciation de la factory
                $tb = jDao::get("radiologie~resexamen");
                // creation d'un record correspondant au dao
                $record = jDao::createRecord("radiologie~resexamen");
                // on remplit le record
                $user =  jAuth::getUserSession();
                $record->user_id=$user->id;
                $record->champ_id = $c->champ_id;
                $record->examen_id = $reception_id;
                $record->acte_id = $c->acte_id;
                $record->valeur = $valeur;
                $record->datecreation=  date('Y-d-m H:i:s');
                $record->datemodification=  date('Y-d-m H:i:s');
                // on le sauvegarde dans la base
                try{
                    //jLog::dump($record);
                    $tb->insert($record);
                    $s=true;
                    
                }  catch (Exception $e){
                    //jLog::dump($e->getTraceAsString());
                    $s=false;
                    
                }
                
            
           
        }
        
        
        return $s;
    }
    
    public function saveFile($file) {
        
        $rep_dest="../var/uploads/";
        $upload = new upload($file);
        $upload->file_overwrite=true;//supprime le fichier si existe
        if ($upload->uploaded) {
            //file
            $upload->file_new_name_body =  uniqid();
            $upload->Process($rep_dest);
            $upload->clean();
            return $rep_dest.$upload->file_dst_name;
        }
        return null;
    }
    
    
}
