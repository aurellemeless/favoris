{literal}

<div class="col-md-12" ng-show="!list">
    <div class="row">
        <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_user"  method="post" role="form" id="form_user">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span> Utilisateur </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('lastname')}">
                               <label for="lastname_user">Nom </label>
                               <input type="text" ng-model="user.lastname" name="lastname" required class="form-control" id="lastname_user" placeholder="Nom de lutilisateur">
                               <p ng-show="isInvalid('lastname')" class="error">
                                   Nom obligatoire
                               </p>
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('firstname')}">
                               <label for="firstname_user">Prenom </label>
                               <input type="text" ng-model="user.firstname" name="firstname" required class="form-control" id="firstname_user">
                               <p ng-show="isInvalid('firstname')" class="error">
                                  Prenom obligatoire
                               </p>
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('email')}">
                               <label for="email_user">E-mail </label>
                               <input type="text" ng-model="user.email" name="email" required class="form-control" id="email_user">
                               <p ng-show="isInvalid('email')" class="error">
                                  E-mail obligatoire
                               </p>
                           </div>
                       </div>
                         <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('phone')}">
                               <label for="phone_user">Téléphone </label>
                               <input type="text" ng-model="user.phone" name="phone" required class="form-control" id="phone_user">
                               <p ng-show="isInvalid('phone')" class="error">
                                 Téléphone obligatoire
                               </p>
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('login')}">
                               <label for="login_user">Login </label>
                               <input type="text" ng-model="user.login" name="login" required class="form-control" id="login_user" placeholder="nom d'utilisateur">
                               <p ng-show="isInvalid('login')" class="error">
                                  Login obligatoire
                               </p>
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('password')}">
                               <label for="password_user">Mot de passe </label>
                               <input type="password" ng-model="user.password" name="password" required class="form-control" id="password_user" placeholder="Mot de passe">
                               <p ng-show="isInvalid('password') && (user.password==user.cpassword)" class="error">
                                  Mot de passe obligatoire
                               </p>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('cpassword')}">
                               <label for="cpassword_user">Confirmer mot de passe </label>
                               <input type="password" ng-model="user.cpassword" name="cpassword" required class="form-control" id="cpassword_user" placeholder="Repeter mot de passe">
                               <p ng-show="isInvalid('cpassword') && (user.password==user.cpassword)" class="error">
                                  Confirmation mot de passe obligatoire
                               </p>
                           </div>
                        </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_user.$invalid" ng-click="save(form_user,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <button ng-show="!user.id" type="button" ng-disabled="form_user.$invalid" ng-click="save(form_user,false);" name="ok" class="btn btn-primary">Enregistrer & nouveau</button>
                               
                               <button type="button"  ng-click="list=!list" name="cancel" class="btn btn-default">Annuler</button>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                   </form>
                        
                </div>
            
            </div>
             
             
        </div>
</div>

<div ng-show="list" class="col-md-8">
  <fieldset>
                        <legend> <span class="glyphicon glyphicon-group"> </span> MON PROFIL </legend>
                        <div class="row">
                           <div class="col-md-3">
                              <img ng-src="{{ ico }}" width="128" height="128" /><br><br>
                             <button type="button" ng-click="list=!list" title="Modifier" class="btn btn-success">
                                  <span class="glyphicon glyphicon-pencil"></span> Modifier
                              </button> 
                           </div>
                           <div class="col-md-8">
                              <table class="table table-bordered">
                                <tr>
                                  <th>Nom </th><td> {{user.lastname }} </td>
                                </tr>
                                <tr>
                                  <th>Prenom </th><td> {{user.firstname}}</td>
                                </tr>
                                <tr>
                                  <th>E-mail </th><td> {{user.email}}</td>
                                </tr>
                                <tr>
                                  <th>T&eacute;l&eacute;phone </th><td> {{user.tel}}</td>
                                </tr>
                              </table>
                           </div>

                       </div>
                    </fieldset>
</div>
    

{/literal}