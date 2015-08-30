{literal}

<div class="col-md-12">
    <div class="row">
       <!-- <h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
            --> <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_param"  method="post" role="form" id="form_param">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span> Paramètres {{ app }}</legend>
                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('id')}">
                               <label for="id_param">Identifiant </label>
                               <input type="text" ng-model="param.id" name="id" required class="form-control" id="title_param" placeholder="Votre Identifiant" value="HGA">
                               <p ng-show="isInvalid('id')" class="error">
                                   Identifiant obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('license')}">
                               <label for="license_param">License </label>
                               <input type="text" ng-model="param.license" name="license" required class="form-control" id="license_param" placeholder="Votre license">
                               <p ng-show="isInvalid('license')" class="error">
                                   License obligatoire
                               </p>
                           </div>
                       </div>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_param.$invalid" ng-click="save(form_param,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <a href="#/extension-installer" class="btn btn-default">Quitter</a>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                    <input type="hidden" name="app" value="{{app}}"/>
                   </form>
                        
                </div>
            
            </div>
               
             
        </div>
</div>
    
{/literal}