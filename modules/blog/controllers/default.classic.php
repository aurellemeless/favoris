<?php
/**
* @package   shop
* @subpackage blog
* @author    your name
* @copyright 2015 NUMERIKA GROUP
* @link      http://www.numerika-group.com 
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
    function detail() {
        $rep = $this->getResponse('html');
        $id = $this->param('id');
        $tb = jDao::get('post');
        if($id){
            $post = $tb->get($id);
            $rep->body->assign('post',$post);
            $rep->bodyTpl = 'detail';
            $rep->title = $post->title;
        }
        return $rep;
    }
}

