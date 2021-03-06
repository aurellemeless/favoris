<?php
/**
* @package   df
* @subpackage browser
* @author    your name
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
        $rep->bodyTpl = 'browser';
        $id = $this->intParam('id');
        $tb = jDao::get('link~link');
        $record = $tb->get($id);
        $rep->body->assign('record', $record);
        return $rep;
    }
    /**
    *
    */
    function read() {
        $rep = $this->getResponse('reader');
        $rep->bodyTpl = 'browser';
        $id = $this->intParam('id');
        $tb = jDao::get('link~link');
        $record = $tb->get($id);
        $content = file_get_contents($record->url);
        $content = str_replace('"/', '"'.$record->url.'/', $content);
        $rep->content = $content;
        return $rep;
    }
}

