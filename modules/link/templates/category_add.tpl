
Link Add
{literal}
<div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_link"  method="post" role="form" id="form_link">
                    <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-link"> </span> Favorite </legend>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('category_id')}">
                               <label for="category_id_link">Cat&eacute;gorie </label>
                               <select name="category_id" required  class="form-control"  ng-model="link.category_id"  id="category_id_link">
                                   <option value="null"> -- Aucune --</option>
                                   <option value="{{ row.id }}" ng-repeat="row in categories">{{ row.title }}</option>
                               </select>
                               <p ng-show="isInvalid('category_id')" class="error">
                                   Categorie obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('title')}">
                               <label for="title_link">Titre </label>
                               <input type="text" ng-model="link.title" name="title" required class="form-control" id="title_link" placeholder="nom de la catégorie">
                               <p ng-show="isInvalid('title')" class="error">
                                   Titre obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('url')}">
                               <label for="url_link">url </label>
                               <input type="text" ng-model="link.url" name="url" required class="form-control" id="url_link" placeholder="nom de la catégorie">
                               <p ng-show="isInvalid('url')" class="error">
                                   url obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_link.$invalid" ng-click="save(form_link,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <button ng-show="!link.id" type="button" ng-disabled="form_link.$invalid" ng-click="save(form_link,false);" name="ok" class="btn btn-primary">Enregistrer & nouveau</button>
                               
                               <button type="reset"  ng-click="list=!list" name="cancel" class="btn btn-default">Annuler</button>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                   </form>
                        
                </div>
            
</div>

<div class="col-md-6">
        Screen Shot
</div>
{/literal}
                               
               
