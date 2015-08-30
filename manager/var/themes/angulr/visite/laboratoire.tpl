{literal}

<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3"> Gestion des Examens de laboratoire </h1>
</div>


<div class="col-md-12" ng-show="!list">
          
      <div class="panel panel-default">
        <div class="panel-heading font-bold"> Details du candidat </div>
          <div class="panel-body">

           <div class="col-md-6">
                <button class="btn btn-success" ng-show="!list"  ng-click="list=!list"><span class="glyphicon glyphicon-list"></span> Liste</button>
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_laboratoire"  method="post" role="form" id="form_laboratoire">
                  <br/><br/>
                    <fieldset>
                        <legend> <span class="glyphicon glyphicon-group"> </span> CANDIDAT</legend>
                        <div class="row">
                           <div class="col-md-3">
                              <img ng-src="{{ ico }}" width="128" height="128" />
                           </div>
                           <div class="col-md-8">
                              <table class="table table-bordered">
                                <tr>
                                  <th>Nom & Prenom </th><td> {{laboratoire.nom + ' '+laboratoire.prenom }} </td>
                                </tr>
                                <tr>
                                  <th>Date de Naissance </th><td> {{laboratoire.ddn}}</td>
                                </tr>
                                <tr>
                                  <th>Lieu de Naissance </th><td> {{laboratoire.ln}}</td>
                                </tr>
                                <tr>
                                  <th>Concour </th><td> {{laboratoire.concour}}</td>
                                </tr>
                              </table>
                           </div>

                       </div>
                    </fieldset>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span>RESULTAT :  BIOCHIMIE SANGUINE </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('creatinine')}">
                               <label for="creatinine_laboratoire">Creatinine </label>
                               <input type="text" ng-model="laboratoire.creatinine" name="creatinine" required class="form-control" id="creatinine_laboratoire" placeholder="taux de creatine">
                               <p ng-show="isInvalid('creatinine')" class="error">
                                   Creatinine obligatoire
                               </p>
                           </div>
                       </div>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_laboratoire.$invalid" ng-click="save(form_laboratoire,true);" name="ok" class="btn btn-success">Enregistrer</button>
                               
                               <button type="reset"  ng-click="list=!list" name="cancel" class="btn btn-danger">Annuler</button>
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
    
<!-- Liste -->   
    
<div ng-show="list" class="col-md-12">

          <div class="panel panel-default">
        <div class="panel-heading font-bold"> LABORATOIRE : Liste des candidats en attente de resultats ( {{ total}}) </div>
          <div class="panel-body">
                       
                        <br/>
                        <div class="table-responsive">
                            <table  ng-table="tableParams" show-filter="true"  class="table  table-bordered table-hover ng-table-responsive">
                                
                                <tbody>
                                    <tr ng-repeat="row in $data">
                                        <td>
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                        </td>
                                        <td data-title="'N° Inscription'" filter="{'matricule':'text'}" sortable="'matricule'">
                                          {{ row.matricule}}
                                        </td>
                                        <td data-title="'Nom'" filter="{'nom':'text'}" sortable="'nom'">
                                          {{ row.nom}}
                                        </td>
                                        <td data-title="'Prenom'" filter="{'prenom':'text'}">
                                          {{ row.prenom}}
                                        </td>
                                        <td data-title="'Date de naissance'" sortable="'ddn'">
                                          {{ row.ddn}}
                                        </td>
                                        <td>
                                            <button type="button" ng-click="edit($index)" title="Saisir le resultat" class="btn btn-success">
                                                <span class="glyphicon glyphicon-pencil"></span> Resultat
                                            </button> 
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                                                 
                        </div>
           </div>             
       </div>                 
    
</div>

{/literal}