<?php
/**
* @package     jelix
* @subpackage  core_response
* @author      Julien Issler
* @contributor Uriel Corfa, Laurent Jouanneau
* @copyright   2007 Julien Issler, 2007 Emotic SARL, 2007-2010 Laurent Jouanneau
* @link        http://www.jelix.org
* @licence     GNU Lesser General Public Licence see LICENCE file or http://www.gnu.org/licenses/lgpl.html
* @since 1.0
*/
//require_once (JELIX_LIB_CORE_PATH.'jResponse.class.php');
/**
 *
 */
class jResponseExcel  extends jResponse {
    
    public $outputFileName = 'report.csv';
    public $data = null;
    

    /*
     * send the PDF to the browser.
     * @return boolean    true if it's ok*/
     
    public function output(){

     $this->_httpHeaders['Content-Type'] = "text/csv";
     // $this->_httpHeaders['Content-Disposition']='attachment; filename='.str_replace('"','\"',$this->outputFileName).'";';
     header('Content-Disposition: attachment; filename="'.str_replace('"','\"',$this->outputFileName).'";');
     $content = $this->data;
     $this->_httpHeaders['Content-length'] = strlen($content);
     $this->export($content);
       return true; 
    }
    
   /* public function output(){
        
        if($this->_outputOnlyHeaders){
            $this->sendHttpHeaders();
            return true;
        }
        
        $this->_httpHeaders['Content-Type'] = "text/csv";
        $content = $this->data;
        $this->_httpHeaders['Content-Disposition']="attachment; filename=".$this->outputFileName.";";
        $this->_httpHeaders['Content-length'] = strlen($content);
        $this->sendHttpHeaders();
        $this->export($content);
        return true;
    }*/

    public function outputErrors(){
    }
   
    public function export($data){
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
  }
}