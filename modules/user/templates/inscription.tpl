{include 'link~header'}

{literal}
<!-- end space1 -->
    <div class="container"  style="background: #fff;">
        
        
        <div class="row">
        <h3 ng-if="inscription.success" class="alert alert-success">{{inscription.msg}}</h3>
        <h4 ng-if="inscription.success==false" class="alert alert-danger">{{ inscription.msg}}</h4>
            <div class="col-md-7">
                <div class="">
                    <form novalidate ng-show="inscription.show"  name="form_user"  method="post" role="form" id="form_user">
                    
                    <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-user"> </span> Inscription</legend>
                       
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
                               <label for="password_user">Mot de passe</label>
                               <input type="password" ng-model="user.password"  name="password" required class="form-control" id="password_user">
                               <p ng-show="isInvalid('password')" class="error">
                                   Mot de passe obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('cpassword')}">
                               <label for="cpassword_user">Confirmer mot de passe</label>
                               <input type="password" ng-model="user.cpassword" name="cpassword" required class="form-control" id="cpassword_user">
                               <p ng-show="isInvalid('cpassword')" class="error">
                                   Confirmation mot de passe obligatoire
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
                               <button type="button" ng-disabled="form_user.$invalid" ng-click="saveUser(form_user);" name="ok" class="btn btn-primary">Valider</button>
                               <button type="reset" name="cancel" class="btn btn-default">Annuler</button>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                     
                   </form>
                        
                </div>
            
            </div>
             <br/><br/>      
            <div class="col-md-5" style="background: #EEEEEE; height: 360px;">
                
            </div>
              
        </div>
    </div>

{/literal}
{include 'link~footer'}