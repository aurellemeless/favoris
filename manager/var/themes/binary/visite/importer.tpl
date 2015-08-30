{literal}


<div class="col-md-12" ng-show="!list">
    <div class="row">
       <!-- --><h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
             <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_importer"  method="post" role="form" id="form_importer">
                  <br/><br/>
                   
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span>IMPORTATION DES CANDIDATS </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="candidats_importer">Fichier CSV (separé par des point virgules " ; " )</label>
                               <input type="file"  name="candidats"  class="form-control" id="candidats_importer">
                               
                           </div>
                       </div>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_importer.$invalid" ng-click="save(form_importer,true);" name="ok" class="btn btn-success">Importer Maintenant </button>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                   </form>
                        
                </div>
            
            </div>
               
             
        </div>
</div>
{/literal}