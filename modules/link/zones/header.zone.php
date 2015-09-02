<?php
/**
* @package   df
* @subpackage link
* @author    your name
* @copyright 2015 SurfMaker 
* @link      http://www.theindice.com 
* @license    All rights reserved
*/

class headerZone extends jZone {
    protected $_tplname='header';

    protected function _prepareTpl(){
        
        $this->_tpl->assign('user',  jAuth::getUserSession());
    }
}
