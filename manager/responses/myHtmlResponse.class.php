<?php
/**
* @package   bos
* @subpackage 
* @author    your name
* @copyright 2011 your name
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/


require_once (JELIX_LIB_CORE_PATH."response/jResponseHtml.class.php");

class myHtmlResponse extends jResponseHtml {

    public $bodyTpl = "bos~main";
    public $appName = " | Administration";
    function __construct() {
        parent::__construct();
        $rootUrl =  jApp::config()->urlengine["basePath"];
        //$this->addCSSLink($rootUrl."www/styles/sb-admin/css/bootstrap.css");
        
        //$this->addCSSLink($rootUrl."www/styles/sb-admin/js/plugins/custom-scrollbar/jquery.mCustomScrollbar.min.css");
       // $this->addCSSLink($rootUrl."www/styles/sb-admin/css/sb-admin.css");
        $this->addCSSLink($rootUrl."www/styles/sb-admin/font-awesome-4.3.0/css/font-awesome.min.css");
        $this->addCSSLink($rootUrl."www/js/tools/angular/toastr/toastr.min.css");
        $this->addCSSLink($rootUrl."www/js/tools/angular/ui-select/select.min.css");
        $this->addCSSLink($rootUrl."www/js/tools/angular/ui-select/select2.css");
        $this->addCSSLink($rootUrl."www/js/tools/angular/colorpicker/colorpicker.min.css");
        $this->addCSSLink($rootUrl."www/js/tools/angular/ng-table/ng-table.min.css");
        $this->addCSSLink($rootUrl."www/js/tools/angular/blockui/angular-block-ui.min.css");
        $this->addCSSLink($rootUrl."www/js/tools/ckeditor/ng-ckeditor.css");
        
        
        $this->addJSLink($rootUrl."www/js/tools/jquery.min.js");
        $this->addJSLink($rootUrl."www/styles/sb-admin/js/plugins/metisMenu/src/metisMenu.js");
        $this->addJSLink($rootUrl."www/js/angular/angular.js");
        $this->addJSLink($rootUrl."www/js/angular/i18n/angular-locale_fr-ci.js");
        $this->addJSLink($rootUrl."www/js/angular/angular-route.min.js");
        $this->addJSLink($rootUrl."www/js/angular/angular-resource.min.js");
        $this->addJSLink($rootUrl."www/js/angular/angular-sanitize.min.js");
        $this->addJSLink($rootUrl."www/js/angular/angular-touch.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/ui-utils.js");
        $this->addJSLink($rootUrl."www/bootstrapui/ui-bootstrap-tpls-0.11.0.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/toastr/toastr.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/ngDraggable.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/ui-select/select.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/colorpicker/bootstrap-colorpicker-module.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/ng-table/ng-table.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/angular-file-upload.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/textAngular/textAngular-sanitize.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/textAngular/textAngular.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/blockui/angular-block-ui.min.js");
        $this->addJSLink($rootUrl."www/styles/sb-admin/js/bootstrap.min.js");
        $this->addJSLink($rootUrl."www/js/tools/angular/blockui/angular-block-ui.min.js");
        $this->addJSLink($rootUrl."www/js/tools/ckeditor/ckeditor.js");
        $this->addJSLink($rootUrl."www/js/tools/ckeditor/ng-ckeditor.min.js");
        $this->addJSLink($rootUrl."www/js/tools/tinymce/tinymce.min.js");
        $this->addJSLink($rootUrl."www/js/tools/tinymce/ui-tinymce.js");
        
        $this->addJSLink($rootUrl."www/styles/sb-admin/js/plugins/custom-scrollbar/jquery.mCustomScrollbar.concat.min.js");
        $this->addJSLink($rootUrl."www/styles/sb-admin/js/sb-admin.js");
        
    }
    

    protected function doAfterActions() {
        // Include all process in common for all actions, like the settings of the
        // main template, the settings of the response etc..

        $this->body->assignIfNone("MAIN","<p>no content</p>");
    }
}
