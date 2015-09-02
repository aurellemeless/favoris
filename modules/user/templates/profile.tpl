{zone 'link~header'}
{meta_html bodyattr array('ng-app'=>'auth', 'ng-cloak'=>'')}

<div class="container" ng-controller="UserProfileController">

		
        <!-- section panier -->
        <section>
            <div class="row" >
           
                        
                    {literal}
        
        <h3 ng-if="operation.success==true" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
            <div class="col-md-7">
                <div class="">
                    <form novalidate   name="form_user" action=""  method="post" role="form" id="form_user">
                    <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-user"> </span> Informations personnelles</legend>
                       
                       <div class="row">
                           <div class="col-xs-4 form-group" ng-class="{'has-error' : isInvalid('lastname')}">
                               <label for="lastname_user">Nom </label>
                               <input type="text" ng-model="user.lastname" name="lastname" required class="form-control" id="lastname_user" placeholder="nom">
                               <p ng-show="isInvalid('lastname')" class="error">
                                   Nom obligatoire
                               </p>
                           </div>
                           <div class="col-xs-6 form-group" ng-class="{'has-error' : isInvalid('firstname')}">
                               <label for="firstname_user">Prenom(s)</label>
                               <input type="text" ng-model="user.firstname" name="firstname" required class="form-control" id="firstname_user" placeholder="prenom">
                               <p ng-show="isInvalid('firstname')" class="error">
                                   Prenom obligatoire
                               </p>
                           </div>
                       </div>
                      
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('email')}">
                               <label for="email_user">E-mail</label>
                               <input type="email" ng-model="user.email" name="email" required class="form-control" id="email_user" placeholder="E-mail">
                               <p ng-show="isInvalid('email')" class="error">
                                   Adresse &eacute;lectronique obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('password')}">
                               <label for="password_user">Ancien mot de passe</label>
                               <input type="password" ng-model="user.apassword"  name="password" class="form-control" id="password_user">
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('password')}">
                               <label for="password_user">Nouveau mot de passe</label>
                               <input type="password" ng-model="user.password"  name="password" class="form-control" id="password_user">
                               <p ng-show="isInvalid('password')" class="error">
                                   Mots de passe différents
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('cpassword')}">
                               <label for="cpassword_user">Confirmer nouveau mot de passe</label>
                               <input type="password" ng-model="user.cpassword" name="cpassword"  class="form-control" id="cpassword_user">
                               <p ng-show="isInvalid('cpassword')" class="error">
                                   Mots de passe différents
                               </p>
                           </div>
                       </div>
                        
                        <div class="row">
                           <div class="col-xs-8">
                                <input type="checkbox" checked ng-model="user.newsletter" name="newsletter" id=newsletter_user"/>
                                <label for="newsletter_user">   
                                    Re&ccedil;evoir notre newsletter
                               </label>
                               <br/><br/>
                           </div>
                       </div>

                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_user.$invalid" ng-click="saveUser(form_user);" name="ok" class="btn btn-lg btn-primary center-block">
                                   <span class="glyphicon glyphicon-save"></span> Enregistrer</button>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                     {/literal}
                   </form>
                        
                </div>
            
            </div>
             
        
                
         </div>
        </section>                    
        <!-- end.section panier -->

</div>
     
        
{include 'link~footer'}
<script src="{jrooturl}www/js/app/controllers/profile.js"></script>
<!-- app -->
