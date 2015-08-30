<?php
/**
* @package   shop
* @subpackage blog
* @author    your name
* @copyright 2015 NUMERIKA GROUP
* @link      http://www.numerika-group.com 
* @license    All rights reserved
*/

class footerZone extends jZone {
    protected $_tplname='footer';

    protected function _prepareTpl(){
        $records = array();
        $tb = jDao::get('post');
        $category_id = $this->param('id');
        $conditions = jDao::createConditions();
        $conditions->addCondition('published', '=', 'YES');
        $conditions->addCondition('category_id', '=', $category_id);
        $records= $tb->findBy($conditions)->fetchAll();
        $this->_tpl->assign('records',$records);
    }
}
