<?php
/**
* @package   shop
* @subpackage user
* @author    Aurelle Meless
* @copyright 2015 Aurelle Meless
* @link      http://www.yourwebsite.undefined
* @license    All rights reserved
*/

class defaultCtrl extends jController {
    public $sitekey = "6Leu7gcTAAAAAAu9jnHg2yaqWqbSVYCQbzWd98Hb";
    public $secretkey = "6Leu7gcTAAAAACaPQdk3WhU23a2mxY1GyndUEAph";
    
    /**
    *
    */
    function lostPass() {
        $rep = $this->getResponse('html');
        $rep->title="Réiniatliser mot de passe étape 1/2 ".$rep->appName;
        //$rep->bodyTpl='main';
        $rep->bodyTpl="user~recoverpass";
        $message = $this->param('msg');
        $rep->body->assign('sitekey',  $this->sitekey);
        $rep->body->assign('MESSAGE',  $message);
        
        return $rep;
    }
    /***
     * activate changed email
     */
    function activePassword() {
        $rep = $this->getResponse('html');
        $rep->title="Réiniatliser mot de passe étape 2/2 ".$rep->appName;
        $success=false;
        $expired = 0;
        $captchaSuccess = false;
        $msg="Echec de l'operation : lien expir&eacute; ";
        $rep->bodyTpl="activepassmessage";
        $token = $this->param('token');
        $password = $this->param('password');
        // security
        $recaptcha=$this->param("g-recaptcha-response");
         if(empty($recaptcha)){
             $success=false;
             $captchaSuccess = false;
             $msg = " Vueillez cocher la case je ne suis pas un robot et respecter les instructions";
        }  else {
            
            $response=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$this->secretkey."&response=".$recaptcha."&remoteip=".$_SERVER['REMOTE_ADDR']);
            if($response.success==false){
                $captchaSuccess = false;
                $msg = "Donn&eacute;es invalides :  Vueillez cocher la case je ne suis pas un robot et respecter les instructions";
            }else{$captchaSuccess = true;}
            
        }
        // end security
        
        
        if(!empty($token) &&  $captchaSuccess && !empty($password)){
            $pass= $password;
            $tb = jDao::get('user');
            $user= $tb->getByKeyactivate($token);
           // $sub->status=1;
            if($user->id){
                
                try{
                    
                    $user->keyactivate='111';
                    jAuth::updateUser($user);
                    jAuth::changePassword($user->login, $pass);
                    //mail
                    $mail = new jMailer(); 
                    $tpl = $mail->Tpl('user~activepassmail',false); 
                    $tpl->assign('user',$user);
                    $tpl->assign('pass',$pass);
                    $mail->Send();
                    $success=true; 
                    $expired = 0;
                    $msg="Op&eacute;ration effectu&eacute;e avec succ&egrave;s : mot de passe"
                            . " r&eacute;initialis&eacute; veuillez consulter votre mail, "
                            . " pour connaitre votre nouveau mot de passe.";

                }catch (Exception $e){
                    $success=false;
                    $expired = 1;
                    $msg="Op&eacute;ration effectu&eacute;e echou&eacute;e:"
                            ."formulaire invalide, votre lien d'activation est peut etre périmé;.";
                }
                
            }  else {
                $expired = 1;
            }
            
        }
        
        $rep->body->assign('MESSAGE',$msg);
        $rep->body->assign('captchaSuccess', $captchaSuccess);
        $rep->body->assign('success', $success);
        $rep->body->assign('expired', $expired);
        $rep->body->assign('token', $token);
        $rep->body->assign('sitekey', $this->sitekey);
        
        return $rep;
    }
    /**
     * 
     */
    function activeAccount() {
        $rep = $this->getResponse('html');
        $rep->title="Activation de compte | ".$rep->appName;
        $token=$this->param("token");
        $success=false;
        $msg="Echec de l'operation : lien expir&eacute;";
        $rep->bodyTpl="activecomptemessage";
        if(!empty($token)){
              $tb = jDao::get('user');
              $user= $tb->getByKeyactivate($token);
           // $sub->status=1;
            if($user->keyactivate==$token){
                
                try{
                    $user->keyactivate='222';
                    $user->active='YES';
                    jAuth::updateUser($user);
                    //mail
                    $mail = new jMailer(); 
                    $tpl = $mail->Tpl('user~activecomptemail',true); 
                    $tpl->assign('user',$user);
                    $tpl->assign('pass',$pass);
                    $mail->Send();
                    $success=true;
                    $msg="Op&eacute;ration effectu&eacute;e avec succ&egrave;s : votre compte a &eacute;t&eacute; activ&eacute;"
                            ." vous pouvez vous connecter sur le site et profiter de ses fonctionnalit&eacute;";

                }catch (Exception $e){
                    $success=false;
                    $msg="Op&eacute;ration d'activation echou&eacute;e: Erreur interne.";
                }
                
            }
            
        }
        $rep->body->assign('MESSAGE',$msg);
        return $rep;
    }
    /***
     * change email
     */
    function changePassword() {
        $rep = $this->getResponse('html');
        $token=  uniqid('',true);
        $email=$this->param("email");
        
        $success=false;
        $msg="Echec de l'operation : lien expir&eacute; ";
        // security
        $recaptcha=$this->param("g-recaptcha-response");
         if(empty($recaptcha)){
             $rep = $this->getResponse('redirect');
             $rep->action = "user~default:lostPass";
             $rep->params = array('msg' => "Formulaire invalide :  Vueillez cocher la case je ne suis pas un robot et respecter les instructions");
             return $rep;
        }  else {
            
            $response=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$this->secretkey."&response=".$recaptcha."&remoteip=".$_SERVER['REMOTE_ADDR']);
            if($response.success==false){

                $rep = $this->getResponse('redirect');
                $rep->action = "user~default:lostPass";
                $rep->params = array('msg' => "Formulaire invalide :  Vueillez cocher la case je ne suis pas un robot et respecter les instructions");
                 return $rep;
            }
            
        }
        // end security
        
        //$userFactory=  jDao::get("user~user");
        $exst= jAuth::getUser($email);
        
        $rep->bodyTpl="changepassmessage";
        
        if(!empty($email) && jFilter::isEmail($email) && ($exst->id)){
            //$userFactory=  jDao::get("user~user");
            $user= jAuth::getUser($email);
           // $user->status=1;
            $user->keyactivate=$token;
            
                try{
                    jAuth::updateUser($user);
                        $success=true;

                }catch (Exception $e){
                    $success=false;
                    $msg="Op&eacute;ration &eacute;chou&eacute;e : "
                            . "Veuillez recommencez s'il vous plait";
                    $rep = $this->getResponse('redirect');
                    $rep->action = "user~default:lostPass";
                    $rep->params = array('msg' => $msg);
                    return $rep;
                }
                if($success){
                    $msg="Op&eacute;ration effectu&eacute;e avec succ&egrave;s : "
                            . "votre mot de passe a ete r&eacute;initialis&eacute;"
                            . " veuillez consulter votre mail pour l'activer";
                    //mail
                    $mail = new jMailer(); 
                    $tpl = $mail->Tpl('user~changepassmail',false); 
                    $tpl->assign('user',$user);
                    $mail->Send();
                }
        }
          
        $rep->body->assign('MESSAGE',$msg);
        return $rep;
    }
    
    function newsletter() {
        $rep = $this->getResponse('html');
        $token=  uniqid('',true);
        $email=$this->param("email");
        $success=false;
        $msg="Echec de l'operation : lien expir&eacute; ";
        $userFactory=  jDao::get("user~user");
        $exst= $userFactory->getByLogin($email);
        
        $rep->bodyTpl="changepassmessage";
        
        if(!empty($email) && jFilter::isEmail($email) && ($exst->id)){
            $userFactory=  jDao::get("user~user");
            $user= $userFactory->getByLogin($email);
           // $user->status=1;
            $user->keyactivate=$token;
            
                try{
                        $userFactory->update($user);
                        $success=true;

                }catch (Exception $e){
                    $success=false;
                    $msg="Op&eacute;ration &eacute;chou&eacute;e : "
                            . "lien p&eacute;rim&eacute;e";
                }
                if($success){
                    $msg="Op&eacute;ration effectu&eacute;e avec succ&egrave;s : "
                            . "votre mot de passe a ete r&eacute;initialis&eacute;"
                            . " veuillez consulter votre mail pour l'activer";
                    //mail
                    $mail = new jMailer(); 
                    $tpl = $mail->Tpl('user~changepassmail',true); 
                    $tpl->assign('user',$user);
                    $mail->Send();
                }
            }
          
        $rep->body->assign('MESSAGE',$msg);
        return $rep;
    }
}

