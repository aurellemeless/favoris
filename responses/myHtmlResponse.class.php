<?php
/**
* @package   df
* @subpackage 
* @author    Aurelle Meless, Sopoude Ronny
* @copyright 2015 SurfMaker
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/


require_once (JELIX_LIB_CORE_PATH.'response/jResponseHtml.class.php');

class myHtmlResponse extends jResponseHtml {

    public $bodyTpl = 'link~main';
    public $appName = ' | doFavorite';
    public $title = 'Save Your links';
                function __construct() {
        parent::__construct();
        $rootUrl =  jApp::config()->urlengine["basePath"];
        $this->addCSSLink($rootUrl."www/styles/default/css/bootstrap.min.css");
        $this->addCSSLink($rootUrl."www/styles/default/css/navbar-fixed-top.css");
        // Include your common CSS and JS files here
        $this->addJSLink($rootUrl."www/styles/default/js/ie-emulation-modes-warning.js");
        
    }

    protected function doAfterActions() {
        // Include all process in common for all actions, like the settings of the
        // main template, the settings of the response etc..

        $this->body->assignIfNone('MAIN','<p>no content</p>');
    }
}
