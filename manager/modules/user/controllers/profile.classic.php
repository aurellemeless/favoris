<?php
/**
* @package   myadmin
* @subpackage user
* @author    aurelle Meless
* @copyright 2011 aurelle Meless
* @link      http://www.ivoiremaker.net
* @license    All rights reserved
*/

class profileCtrl extends jController {
    /**
    *
    */
    function index() {
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="profile";
        //$rep->tpl->assign('user', jAuth::getUserSession());
        return $rep;
    }

    function current(){
        $rep = $this->getResponse('json');

         $rep->data = jAuth::getUserSession();
        return $rep;
    }
    
    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        //parametres
        $password=$this->param('password');
        $lastname=$this->param('lastname');
        $firstname=$this->param('firstname');
        $email=$this->param('email');
        //alert
        $success=false;
        $msg="Profile non modifié";
        //verification
        
            //update
        if(!empty($firstname) && !empty($lastname) && jFilter::isEmail($email)){
            // instanciation de la factory
            $user = jAuth::getUser(jAuth::getUserSession()->id);
            // infos user
            $user->lastname = $lastname;
            $user->firstname = $firstname;
            $user->email = $email;
            // on le sauvegarde dans la base
            try{
                jAuth::updateUser($user);
                if(!empty($password) && ($user->password!=$password)){
                    jAuth::changePassword($user->login, $password);
                }

                $success=true;
            }  catch (Exception $e){
                $success=false;
                 $msg="Profile non modifié";
            }
            if($success)
                $msg="profile modifié ";
        }
        $rep->data=array('success'=>$success,'msg'=>$msg);
        return $rep;
    }
    /*function changePassword() {
        $rep = $this->getResponse('json');
        //parametres
        $login=$this->param('login');
        $password=$this->param('password');
        //alert
        $success=false;
        $msg="mot de passe non modifié";
        //verification
        if(!empty($login) && !empty($password)){
            try{
                $success=jAuth::changePassword($login, $password);
            }  catch (Exception $e){
                $success=false;
                 $msg="mot de passe non modifié";
            }
            if($success)
                $msg="mot de passe modifié ";
        }
        $rep->data=array('success'=>$success,'msg'=>$msg);
        return $rep;
    }*/
    
}

