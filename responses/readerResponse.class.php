<?php
/**
* @package     bf
* @subpackage  bf_response
* @author      Aurelle meless
* @copyright   2015 Aurelle Meless
* @link        http://www.theindice.com
* @licence     s
*/

/**
* Browser reader response
*/
class readerResponse extends jResponse {
    /**
    * @var string
    */
    protected $_type = 'text';

    /**
     * text content
     * @var string
     */
    public $content = '';

    /**
     * output the content with the text/plain mime type
     * @return boolean    true si it's ok
     */
    public function output(){
        
        if($this->_outputOnlyHeaders){
            $this->sendHttpHeaders();
            return true;
        }
        
        $this->_httpHeaders['Content-length']=strlen($this->content);
        $this->sendHttpHeaders();
        echo $this->content;
        return true;
    }

    /**
     * output errors
     */
    public function outputErrors(){
        header("HTTP/1.0 500 Internal Jelix Error");
        header('Content-Type: text/plain;charset='.jApp::config()->charset);
        echo jApp::coord()->getGenericErrorMessage();
    }
}
