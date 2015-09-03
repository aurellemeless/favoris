<?php
/**
* @package   df
* @subpackage link
* @author    Aurelle Meless, Sopoude Ronny
* @copyright 2015 SurfMaker
* @link      http://www.theindice.com 
* @license    All rights reserved
*/

class defaultCtrl extends jController {
    /**
    *
    */
    function index() {
        $rep = $this->getResponse('html');

        return $rep;
    }
    
    /**
    *
    */
    function about() {
        $rep = $this->getResponse('html');
        $rep->bodyTpl = 'about';
        return $rep;
    }
    
    /**
    *
    */
    function favorite() {
        $rep = $this->getResponse('html');
        $rep->bodyTpl = 'favorite_main';
        return $rep;
    }
    
    /**
    *
    */
    function dashboard() {
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname = 'favorite_dashboard';
        return $rep;
    }
}

