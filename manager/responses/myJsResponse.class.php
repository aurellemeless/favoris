<?php
/**
* @package   BOS
* @subpackage 
* @author    aurelle Meless
* @copyright 2011 your name
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/


//require_once (JELIX_LIB_CORE_PATH.'jResponse.class.php');

class myJsResponse extends jResponse {

    public $data = null;


    public function output(){
        
        if($this->_outputOnlyHeaders){
            $this->sendHttpHeaders();
            return true;
        }
        
        $this->_httpHeaders['Content-Type'] = "application/javascript";
        $content = $this->data;
        $this->_httpHeaders['Content-length'] = strlen($content);
        $this->sendHttpHeaders();
        echo $content;
        return true;
    }

    public function outputErrors(){
    }
}
