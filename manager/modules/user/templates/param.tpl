{literal}

<div class="col-md-12">
    <div class="row">
       <!-- <h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
            --> <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_param"  method="post" role="form" id="form_param">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span> Paramètres </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('pass')}">
                               <label for="pass_param">Stratégie de mot de passe </label>
                               <input type="text" ng-model="param.pass" name="pass" required class="form-control" id="pass_param">
                               
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_param.$invalid" ng-click="save(form_param);" name="ok" class="btn btn-primary">Enregistrer</button>
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