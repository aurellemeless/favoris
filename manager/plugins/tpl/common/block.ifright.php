<?php
/**
* @package     bos
* @subpackage  user
* @author      Aurelle Meless
* @copyright   2015 Aurelle Meless
* @link        http://www.internet-aff.com
*/

function jtpl_block_common_ifright($compiler, $begin, $param=array())
{
   
    if($begin){
        if(count($param) == 1){
            $content = ' if(right::check('.$param[0].')):';
        }else{
            $content='';
            $compiler->doError2('errors.tplplugin.block.bad.argument.number','ifright',2);
        }
    }else{
        $content = ' endif; ';
    }
    return $content;
}
