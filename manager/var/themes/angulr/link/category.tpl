{literal}
<div class="panel">
    <div class="wrapper-md">
        <div class="row">
<div class="col-md-12">
    <button class="btn btn-success" ng-show="!list"  ng-click="list=!list"><span class="glyphicon glyphicon-list"></span> Liste</button>
    <button class="btn btn-success" ng-show="list" ng-click="new()"> <span class="glyphicon glyphicon-plus"></span> Nouveau</button>
    <button class="btn btn-danger" ng-show="list" ng-click="removeAll()"> <span class="glyphicon glyphicon-remove"></span> Supprimer</button>
</div>

<div class="col-md-12" ng-show="!list">
    <div class="row">
       <!-- <h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
            --> <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_category"  method="post" role="form" id="form_category">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-category"> </span> Categorie </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('title')}">
                               <label for="title_category">Titre </label>
                               <input type="text" ng-model="category.title" name="title" required class="form-control" id="title_category" placeholder="nom de la catégorie">
                               <p ng-show="isInvalid('title')" class="error">
                                   Titre obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_category.$invalid" ng-click="save(form_category,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <button ng-show="!category.id" type="button" ng-disabled="form_category.$invalid" ng-click="save(form_category,false);" name="ok" class="btn btn-primary">Enregistrer & nouveau</button>
                               
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
    <div class="box">
                        <h2>Categories</h2>
                        <br/>
                        <div class="table-responsive">
                            <table ng-table="tableParams" show-filter="true" class="table table-bordered table-hover">

                                <tbody>
                                    <tr ng-repeat="row in $data">
                                        <td data-title="'#'">
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                        </td>
                                        <td data-title="'Titre'" filter="{ 'title': 'text' }" sortable="'title'">
                                            {{row.title}}
                                        </td>
                                        <td data-title="'Description'">
                                           {{row.description}}
                                       </td>
                                       <td data-title="'Action'"  >
                                           <button type="button" ng-click="edit($index)" title="Modifier" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-pencil"></span> 
                                            </button> 
                                           <button type="button" ng-click="remove(row.id)" title="Modifier" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span> 
                                            </button> 
                                      </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                                                 
                        </div>
                        
      </div>     
        </div> 
    </div>  
</div>
{/literal}
