<?php
/**
* @package   df
* @subpackage user
* @author    aurelle Meless
* @copyright 2011 aurelle Meless
* @link      http://www.ivoiremaker.net
* @license    All rights reserved
*/

class userCtrl extends jController {
    /**
    *
    */
    public $success=false;
    public $message;
    public $pluginParams = array('*'=>array('auth.required'=>false));
   
    function inscription() {
        $rep = $this->getResponse('html');
        $this->message = $this->param('msg');
        $rep->title="Inscription ".$rep->appName;
        $rep->bodyTpl='inscription';
        $rep->body->assign('message',  $this->message);
        
        return $rep;
    } 
    
    function current() {
        $rep = $this->getResponse('json');
        $u = jAuth::getUserSession();
        
        if($u->birthdate){
            $dt = new DateTime($u->birthdate);
            $rep->data = array('firstname'=>$u->firstname,
                            'lastname'=>$u->lastname,
                            'email'=>$u->email,
                            'birthdate'=>$u->birthdate,
                            'day'=>$dt->format('d'),
                            'month'=>$dt->format('m'),
                            'year'=>$dt->format('Y'),
                        );
        }else{
             $rep->data = array('firstname'=>$u->firstname,
                            'lastname'=>$u->lastname,
                            'email'=>$u->email,
                            'birthdate'=>'',
                            'day'=>'',
                            'month'=>'',
                            'year'=>'',
                        );
        }
        
        
        return $rep;
    }
   
    function create(){
	$rep = $this->getResponse('html');
        $rep->title="Bienvenue | ".$rep->appName;
	//	
        $password=$this->param('password');
        $firstname=$this->param('firstname');
        $lastname=$this->param('lastname');
        $email=$this->param('email');
        $professionnel=$this->param('professionnel','NO',true);
        $this->success=false;
        $this->message="Erreur: veuillez remplir tous les champs obligatoires.";
        //si ville et commune existe
        if(!empty($email) && !empty($password) && !empty($lastname) && !empty($firstname)){
            // instanciation 
            $user = jAuth::createUserObject($email, $password);
            // infos user
            $user->firstname =$firstname;
            $user->lastname = $lastname;
            $user->email = $email;
            $user->keyactivate = uniqid('',true);
           // $user->professionnel = $professionnel;
           //jLog::dump($user);
            try {
                
                           
                    $nu = jAuth::saveNewUser($user) ; 
                    //set user as customer
//                    $tbcust = jDao::get('customer~account');
//                    $custRecord = jDao::createRecord('customer~account');
//                    $custRecord->user_id = $nu->id;
//                    $tbcust->insert($custRecord);
                    // end 
                    $this->success=true;
                    $this->message ="Votre compte a &eacute;t&eacute; cr&eacute;e avec succ&egrave;s, un e-mail de "
                    . " confirmation vous "
                    . " a &eacute;t&eacute; envoy&eacute; à l'adresse : ".$email;

                   /* $mail = new jMailer(); 

                    $tpl = $mail->Tpl('user~createmail',true); 
                    $tpl->assign('user',$user);
                    $mail->Send();
                   */


            } catch (Exception $exc) {
                $this->message = "D&eacute;sole votre inscription a &eacute;chou&eacute;e veuillez reesayer ult&eacute;rieurement.";
                $rep = $this->getResponse('redirect');
                $rep->action = "user~user:inscription";
                $rep->params = array('msg'=>  $this->message); 
                return $rep;
            }   
           
        }	
        $rep->bodyTpl='create';
        $rep->body->assign('message',  $this->message);
        
        return $rep;
    }
    
    function ckeckEmail() {
        $rep = $this->getResponse('json');
	//	
        $q=$this->param('q');
        $tb = jDao::get('user');
        $user = $tb->getByEmail($q);
        if($user->id)
            $this->success = true;
        $rep->data=array('exist'=>  $this->success);
        
        return $rep;
    }
    
    
 /*   
    function create(){
	$rep = $this->getResponse('json');
	//	
        $password=$this->param('password');
        $firstname=$this->param('firstname');
        $lastname=$this->param('lastname');
        $email=$this->param('email');
        $professionnel=$this->param('professionnel','NO',true);
        //$description=$this->param('description');
        //$title=$this->param('title');
        //$newsletter=$this->intParam('newsletter',1,true);
        $this->success=false;
        $this->message="Erreur: veuillez remplir tous les champs obligatoires.";
        //si ville et commune existe
        if(!empty($email) && !empty($password) && !empty($lastname) && !empty($firstname)){
            // instanciation 
            $user = jAuth::createUserObject($email, $password);
            // infos user
            $user->firstname =$firstname;
            $user->lastname = $lastname;
            $user->email = $email;
            $user->professionnel = $professionnel;
            try {
                
                if(jAuth::saveNewUser($user)){
                    
                    if( ($professionnel == 'YES') && !empty($title) ){
                            
                        $u=jAuth::getUser($email);
                        $s=jClasses::getService('house~company');
                        $s->create($u,$title,$description);
                    }
                   
                    
                    $this->success=true;
                    $this->message ="Votre compte a été crée avec succès, un e-mail de "
                        . " confirmation vous "
                        . " a été envoyé à l'adresse : ".$email;
                    
                }
            } catch (Exception $exc) {
                $this->success=false;
                $this->message="Echec création compte";
            }           
            
        }	
        $rep->data=array('success'=>  $this->success,'msg'=>$this->message);
        return $rep;
    }
  
  */
    
}

