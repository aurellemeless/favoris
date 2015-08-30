{literal}

<div class="col-md-12">
    <button class="btn btn-success" ng-show="!list"  ng-click="list=!list"><span class="glyphicon glyphicon-list"></span> Liste</button>
    <button class="btn btn-success" ng-show="list" ng-click="new()">Nouveau</button>
</div>

<div class="col-md-12" ng-show="!list">
    <div class="row">
       <!-- <h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
            --> <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_feature"  method="post" role="form" id="form_feature">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span> Fonctionnalit&eacute; </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('title')}">
                               <label for="title_feature">Code </label>
                               <input type="text" ng-model="feature.title" name="title" required class="form-control" id="title_feature" placeholder="nom de la catégorie">
                               <p ng-show="isInvalid('title')" class="error">
                                   Code obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="description_feature">Description</label>
                               <textarea ng-model="feature.description" name="description"  class="form-control" id="description_feature" placeholder="brève description de la catégorie">
                               </textarea>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_feature.$invalid" ng-click="save(form_feature,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <button ng-show="!feature.id" type="button" ng-disabled="form_feature.$invalid" ng-click="save(form_feature,false);" name="ok" class="btn btn-primary">Enregistrer & nouveau</button>
                               
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

                        <h2>Liste des Fonctionnalit&eacute;s</h2>
                        <br/>
                        <div class="table-responsive">
                            <table  ng-table="tableParams" show-filter="true"  class="table  table-bordered table-hover ng-table-responsive">
                                
                                <tbody>
                                    <tr ng-repeat="row in $data">
                                        <td>
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                        </td>
                                        <td data-title="'Code'" filter="{'title':'text'}" sortable="'title'">
                                          {{ row.title}}
                                        </td>
                                        <td data-title="'Description'" filter="{'description':'text'}">
                                          {{ row.description}}
                                        </td>
                                        <td>
                                            <button type="button" ng-click="edit($index)" title="Modifier" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-pencil"></span> 
                                            </button> 
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                                                 
                        </div>
                        

    
</div>

{/literal}