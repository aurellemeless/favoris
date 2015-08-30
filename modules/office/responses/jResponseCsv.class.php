<?php
/**
* @package     school
* @subpackage  office
* @author      Aurelle Meless
*/
require_once (JELIX_LIB_CORE_PATH.'jResponse.class.php');
/**
 *
 */
class jResponseCsv  extends jResponse {
    
    public $outputFileName = 'report.csv';
    public $data = null;
    

    /*
     * @return boolean    true if it's ok*/
     
    public function output(){
    $this->clearHttpHeaders();
    $content = $this->getContent($this->data);
    $this->addHttpHeader('Cache-Control', 'must-revalidate, pre-check=0, public'); // HTTP/1.1
    $this->addHttpHeader('Pragma', 'public', false);
    $this->addHttpHeader('Expires', '0');
    $this->addHttpHeader('Last-Modified', gmdate("D, d M Y H:i:s")." GMT", false);
    $this->addHttpHeader("Content-length",strlen($content));
    $this->addHttpHeader("Content-Type","application/force-download");
    $this->addHttpHeader("Content-Type","application/vnd.ms-excel");
    $this->addHttpHeader("Content-Disposition",'attachment; filename="'.str_replace('"','\"',$this->outputFileName).'.csv";');
    $this->sendHttpHeaders();
    
    echo $content;
      //flush();
       return true; 
    }
    
    public function outputErrors(){
    }
   
    public function getContent($data){
        $s=null;
       if(count($data)>1){
            $i=0;           
            foreach ($data as $v) {
               if($i==0){
                $s.= '"'.implode('";"',array_keys($v)).'"'."\n";
               }else{
                   $s.= '"'.implode('";"',$v).'"'."\n";
               }
               $i++;
            } 
       }else {
           foreach ($data as $v) {
                $s.='"'.implode('";"',array_keys($v)).'"'."\n";
                $s.= '"'.implode('";"',$v).'"'."\n";
           }
       }
       
       return $s;
  }
    
   /* public function export($data){
       if(count($data)>1){
            $i=0;           
            foreach ($data as $v) {
               if($i==0){
                echo '"'.implode('";"',array_keys($v)).'"'."\n";
               }else{
                   echo '"'.implode('";"',$v).'"'."\n";
               }
               $i++;
             } 
       }else {
           foreach ($data as $v) {
                echo '"'.implode('";"',array_keys($v)).'"'."\n";
                echo '"'.implode('";"',$v).'"'."\n";
           }
       }
  }*/
}