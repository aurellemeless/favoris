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
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('tva')}">
                               <label for="title_param">TVA </label>
                               <input type="text" ng-model="param.title" name="tva" required class="form-control" id="title_param" placeholder="Taxe à valeur ajoutée">
                               <p ng-show="isInvalid('tva')" class="error">
                                   TVA obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="description_param">Description</label>
                               <textarea ng-model="param.description" name="description"  class="form-control" id="description_param" placeholder="brève description de votre activite">
                               </textarea>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="header_param">Entete de facture </label>
                               <textarea ng-model="param.header" name="header"  class="form-control" id="header_param" placeholder="Entête de page de la facture">
                               </textarea>
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="footer_param">Pied de page facture </label>
                               <textarea ng-model="param.footer" name="footer"  class="form-control" id="footer_param" placeholder="Pied de page de la facture">
                               </textarea>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_param.$invalid" ng-click="save(form_param,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               <button type="button" name="cancel" class="btn btn-default">Quitter</button>
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