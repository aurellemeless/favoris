<?php
/**
* @package   kwaba
* @subpackage
* @author    Aurelle Meless
* @copyright 2015 Aurelle Meless
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/

define(BASEPATH,jApp::config()->urlengine["basePath"].'www/');

class phpResponse extends jResponse{

    public $tplname = 'shop~main';
    public $appName='Akwaba';
    public $templateDir = 'templates';
    public $ext = '.php';
    public $_vars = array();

    function __construct() {

    }

    function assign($var, $value){
        $this->_vars[$var] = $value;
    }
    public function output(){

      foreach ($this->_vars as $key => $value) {
          $this->$key = $value;
      }
      $this->render();
      $this->doAfterActions();
    }

    function render(){

      $file = explode('~', $this->tplname);
      if(sizeof($file)<2){
        $filePath = 'modules/'.jApp::getCurrentModule().'/'.$this->templateDir.'/'.$this->tplname.$this->ext;
      }else{
        $filePath = 'modules/'.$file[0].'/'.$this->templateDir.'/'.$file[1].$this->ext;
      }

      if(file_exists($filePath)){
          require_once $filePath;
      }else{
        header("HTTP/{$this->httpVersion} 500 Internal jelix error");
        header('Content-type: text/plain');
        echo jApp::coord()->getGenericErrorMessage();
      }

    }

    protected function doAfterActions() {
        // Include all process in common for all actions, like the settings of the
        // main template, the settings of the response etc..
    }
}
