{literal}

<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3"> IMPORTATION DES CANDIDATS </h1>
</div>

<div class="col-md-12" ng-show="!list">
    <div class="panel panel-default">
        <div class="panel-heading font-bold">Ajout de nouveaux candidats</div>
        <div class="panel-body">
          


       <h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
             <div class="col-md-6">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_importer"  method="post" role="form" id="form_importer">
                  <br/>
                   
                    <fieldset>
                       
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

               
       
</div>
{/literal}