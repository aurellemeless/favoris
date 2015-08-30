<?php
/**
* @package    bos
* @subpackage right
* @author     Aurelle Meless
* @copyright  2014 babicms
**/

class right {

    
    private function __construct (){ }
    
    
    public static function check($alias){
		
		$cnx = jDb::getConnection();
		$user = jAuth::getUserSession();

         try {  
		 
			//informations de connection profile DB
              $sql ="SELECT COUNT(F.id) AS total FROM ".$cnx->prefixTable('user')." U
                      RIGHT JOIN ".$cnx->prefixTable('user_group')." UG ON U.id = UG.user_id
                      RIGHT JOIN ".$cnx->prefixTable('group_feature')." GF ON UG.group_id = GF.group_id
                      RIGHT JOIN ".$cnx->prefixTable('feature')." F ON GF.feature_id = F.id
                      WHERE UG.user_id = '".$user->id."' AND (F.title = '".$alias."' OR F.title = '*') ";
              $rs = $cnx->query($sql); 
              $record = $rs->fetch();
              
              if($record->total>=1){
                  $result = true;
              }  else {
                  $result = false;
              }
              return $result;
         }
          catch (Exception $e) {
            throw new Exception($e);
         }      
    }
 
}
