{literal}

<div class="col-md-12">
    <button class="btn btn-success" ng-show="!list"  ng-click="list=!list"><span class="glyphicon glyphicon-list"></span> Liste</button>
    <button class="btn btn-success" ng-show="list" ng-click="new()">Nouveau</button>
    <button class="btn btn-primary" ng-show="list"  >Modifier</button>
</div>

<div class="col-md-12" ng-show="!list">
    <div class="row">
       <!-- <h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
            --> <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_group"  method="post" role="form" id="form_group">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span> Groupe </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('title')}">
                               <label for="title_group">Titre </label>
                               <input type="text" ng-model="group.title" name="title" required class="form-control" id="title_group" placeholder="nom du groupe">
                               <p ng-show="isInvalid('title')" class="error">
                                   Titre obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="description_group">Description</label>
                               <textarea ng-model="group.description" name="description"  class="form-control" id="description_group" placeholder="brève description du groupe">
                               </textarea>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_group.$invalid" ng-click="save(form_group,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <button ng-show="!group.id" type="button" ng-disabled="form_group.$invalid" ng-click="save(form_group,false);" name="ok" class="btn btn-primary">Enregistrer & nouveau</button>
                               
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

                        <h2>Liste des groupes</h2>
                        <br/>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>ID</th>
                                        <th>Titre</th>
                                        <th>Description</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="row in groups">
                                        
                                        <td>
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                        </td>
                                        <td>{{ row.id }}</td>
                                        <td>{{ row.title}}</td>
                                        <td>{{ row.description }}</td>
                                        <td>
                                            <button type="button" ng-click="edit($index)" title="Modifier" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-pencil"></span> 
                                            </button> 
                                            <a href="#/user-group-feature/{{ row.id }}" title="Ressource" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-flash"></span> 
                                            </a>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                                                 
                        </div>
                        

    
</div>
{/literal}