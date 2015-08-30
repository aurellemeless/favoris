<?php
/**
* @package   myadmin
* @subpackage user
* @author    aurelle Meless
* @copyright 2011 aurelle Meless
* @link      http://www.ivoiremaker.net
* @license    All rights reserved
*/

class userCtrl extends jController {
    
    protected  $success=false;
    protected  $msg='Données invalides';
    /**
    **/
    function index(){
        $rep = $this->getResponse('htmlfragment');
        $rep->tplname="user";
        return $rep;
    }
    /**
    *
    */
    function read() {
        $rep = $this->getResponse('json');
        $liste=array();
        $id = $this->intParam('id',null,true);
        $page = $this->intParam('page',1,true);
	$rows = $this->intParam('rows',10,true);
	$offset = ($page-1)*$rows;
        // instanciation de la factory
        $tb = jDao::get("user");
        
        $conditions=  jDao::createConditions();
        $conditions->addItemOrder('id', 'DESC');
        $records=$tb->findBy($conditions)->fetchAll();
        // $liste['total']=$userFactory->countAll();
           
        $rep->data["Items"] = $records;
        $rep->data["Count"] = $tb->countBy($conditions);
        return $rep;
    }
    /**
    *
    */
    function save() {
        $rep = $this->getResponse('json');
        //parametres
        $id=$this->intParam('id', null, true);
        $active=$this->param('active','NO',true);
        $login=$this->param('login');
        $password=$this->param('password');
        $lastname=$this->param('lastname');
        $firstname=$this->param('firstname');
        $email=$this->param('email');
        $phone=$this->param('phone');
        //verification
        if($id){
            //update
            if(!empty($firstname) && !empty($lastname) && !empty($active)
                    && jFilter::isEmail($email)){
                // instanciation de la factory
                $user = jAuth::getUser($login);
                // infos user
                $user->phone = $phone;
                $user->lastname = $lastname;
                $user->firstname = $firstname;
                $user->email = $email;
                $user->active = $active;
                // on le sauvegarde dans la base
                try{
                    jAuth::updateUser($user);
                    if(!empty($password) && ($user->password!=$password)){
                        jAuth::changePassword($user->login, $password);
                    }
                    
                    $this->success=true;
                    $this->msg="utilisateur modifié ";
                }  catch (Exception $e){
                    $this->success=false;
                     $this->msg="utilisateur non modifié";
                }
                    
            }
        } else {
            //insert
            if(!empty($login) && !empty($password) && !empty($firstname)
                    && !empty($lastname) && !empty($active) && jFilter::isEmail($email)){
                // instanciation 
                $user = jAuth::createUserObject($login, $password);
                // infos user
                $user->phone = $phone;
                $user->lastname = $lastname;
                $user->firstname = $firstname;
                $user->email = $email;
                $user->active = $active;
                // on le sauvegarde dans la base
                try{
                    $this->success=  jAuth::saveNewUser($user);
                    $this->msg="utilisateur ajouté ";
                }  catch (Exception $e){
                    $this->success=false;
                    $this->msg="utilisateur non ajouté";
                }
                    
            }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    function changePassword() {
        $rep = $this->getResponse('json');
        //parametres
        $login=$this->param('login');
        $password=$this->param('password');
        //alert
        $this->success=false;
        $this->msg="mot de passe non modifié";
        //verification
        if(!empty($login) && !empty($password)){
            try{
                $this->success=jAuth::changePassword($login, $password);
            }  catch (Exception $e){
                $this->success=false;
                 $this->msg="mot de passe non modifié";
            }
            if($this->success)
                $this->msg="mot de passe modifié ";
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    
    function publish() {
        $rep = $this->getResponse('json');
        $id=$this->intParam('id', null, true);
        if(!empty($id)){
                try{
                     // instanciation de la factory
                    $tb = jDao::get("user");
                    $user=$tb->get($id);
                    if($user->active=='YES'){
                        $user->active='NO';
                        $this->msg="utilisateur depublié";
                    }else{
                        $user->active='YES';
                        $this->msg="utilisateur publié";
                    }
                    $tb->update($user);
                    $this->success=true;
                }  catch (Exception $e){
                    $this->success=false;
                    $this->msg="ERREUR";
                }
                
        }
        $rep->data=array('success'=>  $this->success,'msg'=>  $this->msg);
        return $rep;
    }
    /**
    *
    */
    function delete() {
        $rep = $this->getResponse('json');
        $id = $this->intParam('id', null, true);
        $this->success=false;
        
        if(!empty($id)){
                try{
                    $user = jDao::get('user')->get($id);
                    // instanciation de la factory
                    $this->success= jAuth::removeUser($user->login);
                    $this->msg="utilisateur supprimé ";
                }  catch (Exception $e){
                    $this->success=false;
                    $this->msg="ERREUR : utilisateur non supprimé ";
                }
        }
        $rep->data=array('success'=>$this->success,'msg'=>$this->msg);
        return $rep;
    }
    function isConnected() {
        $rep = $this->getResponse('json');
        $rep->data=array('success'=>jAuth::isConnected());
        return $rep;
    }
    
    function view(){
        $rep = $this->getResponse('json');
        $data=null;
        $login = $this->param('id',null,true);
        // instanciation de la factory
        $userFactory = jDao::get("user");
        
        if(!empty($login)){
            $user = jAuth::getUser($login);
            $data=array('login'=>$user->login,
                        'lastname'=>$user->lastname,
                        'firstname'=>$user->firstname,
                        'email'=>$user->email,
                        'id'=>$user->id);
        }else{
            $data=array('login'=>'',
                        'lastname'=>'',
                        'firstname'=>'',
                        'id'=>'');
        }
        $rep->data=$data;
        return $rep;
    }
}

