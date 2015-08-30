<?php
/**
* @package     shop
* @subpackage  jtpl_plugin
* @author      Aurelle Meless
* @copyright   2015 Aurelle Meless
* @link        http://www.jelix.org
* @licence     GNU Lesser General Public Licence see LICENCE file or http://www.gnu.org/licenses/lgpl.html
*/

/**
 * a special if block to test easily a right value
 *
 * <pre>{ifright 'subject',54} ..here generated content if the user has the right  {/ifright}</pre>
 * @param jTplCompiler $compiler the template compiler
 * @param boolean $begin true if it is the begin of block, else false
 * @param array $param 0=>subject 1=>optional resource
 * @return string the php code corresponding to the begin or end of the block
 */
function jtpl_block_common_ifright($compiler, $begin, $param=array())
{
    if($begin){
        if(count($param) == 1){
            $content = ' if(jAcl2::check('.$param[0].')):';
        }elseif(count($param) == 2){
            $content = ' if(jAcl2::check('.$param[0].','.$param[1].')):';
        }else{
            $content='';
            $compiler->doError2('errors.tplplugin.block.bad.argument.number','ifright',1);
        }
    }else{
        $content = ' endif; ';
    }
    return $content;
}
