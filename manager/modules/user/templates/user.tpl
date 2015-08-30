{literal}

<div class="col-md-12">
    <button class="btn btn-success" ng-show="!list"  ng-click="list=!list"><span class="glyphicon glyphicon-list"></span> Liste</button>
    <button class="btn btn-success" ng-show="list" ng-click="new()">Nouveau</button>
    <button class="btn btn-danger" ng-show="list" ng-click="removeAll()" >Supprimer</button>
</div>

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
                               
                               <button type="reset"  ng-click="list=!list" name="cancel" class="btn btn-default">Annuler</button>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                   </form>
                        
                </div>
            
            </div>
             
        <div class="col-md-6">
                <div class="row">
                    <div class="col-xs-5 form-group">
                        <label for="group_group">Groupe </label>
                        <select ng-model="group_id" name="group_id" required class="form-control" id="group_id_group" >
                            <option value="null"> -- Selectionnez -- </option>
                            <option ng-repeat="row in groups" value="{{ row.id }}"> {{ row.title }} </option>
                        </select>
                    </div>
                    <div class="col-xs-3 form-group">
                        <br/>
                        <button type="button"  ng-click="addGroup()" name="addGroup" class="btn btn-info" title="Ajouter"> <span class="glyphicon glyphicon-plus"></span></button>
                    </div>
                 </div>
            <table class="table">
                <tr>
                    <th> Titre </th>
                    <th> Description </th>
                    <th>  </th>
                </tr>
                <tr ng-repeat="row in usergroups">
                    <td> {{ row.group_title }} </td>
                    <td> {{ row.group_description }} </td>
                    <td>  
                        <button type="button"  ng-click="removeGroup(row.group_id)" name="removeGroup" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> 
                        </button>
                    </td>
                </tr>
            </table>
        </div>
             
        </div>
</div>
    
<!-- Liste -->   
    
<div ng-show="list" class="col-md-12">

                        <h2>Liste des utilisateurs</h2>
                        <br/>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>
                                        <th>Nom</th>
                                        <th>Prenom</th>
                                        <th>Login</th>
                                        <th>Téléphone</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="row in users">
                                        
                                        <td>
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                        </td>
                                        <td>{{ row.id }}</td>
                                        <td>{{ row.lastname}}</td>
                                        <td>{{ row.firstname}}</td>
                                        <td>{{ row.login }}</td>
                                        <td>{{ row.phone }}</td>
                                        <td>
                                            <button type="button" ng-click="edit($index)" title="Modifier" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-pencil"></span> 
                                            </button> 
                                            <button type="button" ng-click="remove(row.id)" title="Supprimer" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span> 
                                            </button>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                                                 
                        </div>
                        

    
</div>
{/literal}