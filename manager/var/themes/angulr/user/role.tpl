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
                    <form novalidate  enctype="multipart/form-data"   name="form_role"  method="post" role="form" id="form_role">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span> Role </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('title')}">
                               <label for="title_role">Titre </label>
                               <input type="text" ng-model="role.title" name="title" required class="form-control" id="title_role" placeholder="nom du role">
                               <p ng-show="isInvalid('title')" class="error">
                                   Titre obligatoire
                               </p>
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('code')}">
                               <label for="code_role">Code </label>
                               <input type="text" ng-model="role.code" name="code" required class="form-control" id="code_role">
                               <p ng-show="isInvalid('code')" class="error">
                                  Code obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="description_role">Description</label>
                               <textarea ng-model="role.description" name="description"  class="form-control" id="description_role" placeholder="brève description">
                               </textarea>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_role.$invalid" ng-click="save(form_role,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <button ng-show="!role.id" type="button" ng-disabled="form_role.$invalid" ng-click="save(form_role,false);" name="ok" class="btn btn-primary">Enregistrer & nouveau</button>
                               
                               <button type="reset"  ng-click="list=!list" name="cancel" class="btn btn-default">Annuler</button>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                   </form>
                        
                </div>
            
            </div>
               
             
        </div>
</div>
    
<!-- Liste -->   
    
<div ng-show="list" class="col-md-12">

                        <h2>Liste des Roles</h2>
                        <br/>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>
                                        <th>Code</th>
                                        <th>Titre</th>
                                        <th>Description</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="row in roles">
                                        
                                        <td>
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                        </td>
                                        <td>{{ row.id }}</td>
                                        <td>{{ row.code}}</td>
                                        <td>{{ row.title}}</td>
                                        <td>{{ row.description }}</td>
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