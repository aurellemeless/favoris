{literal}

<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3"> Gestion des Examens de radiologie </h1>
</div>

<div class="col-md-12" ng-show="!list">
    <div class="panel panel-default">
      <div class="panel-heading font-bold"> Details du candidat </div>
      <div class="panel-body">
          
           <div class="col-md-6">
            <button class="btn btn-success" ng-show="!list"  ng-click="list=!list"><span class="glyphicon glyphicon-list"></span> Liste</button>
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_radiologie"  method="post" role="form" id="form_radiologie">
                  <br/><br/>
                    <fieldset>
                        <legend> <span class="glyphicon glyphicon-group"> </span> CANDIDAT </legend>
                        <div class="row">
                           <div class="col-md-3">
                              <img ng-src="{{ ico }}" width="128" height="128" />
                           </div>
                           <div class="col-md-8">
                              <table class="table table-bordered">
                                <tr>
                                  <th>Nom & Prenom </th><td> {{radiologie.nom + ' '+radiologie.prenom }} </td>
                                </tr>
                                <tr>
                                  <th>Date de Naissance </th><td> {{radiologie.ddn}}</td>
                                </tr>
                                <tr>
                                  <th>Lieu de Naissance </th><td> {{radiologie.ln}}</td>
                                </tr>
                                <tr>
                                  <th>Concour </th><td> {{radiologie.concour}} </td>
                                </tr>
                              </table>
                           </div>

                       </div>
                    </fieldset>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span>RESULTAT :  RADIO POUMON FACE  </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('radio')}">
                               <label for="radio_radiologie">Interpretation </label>
                               <textarea ng-model="radiologie.radio" name="radio" required class="form-control" id="radio_radiologie" placeholder="Saisir l'interpretation ici "> </textarea>
                               <p ng-show="isInvalid('radio')" class="error">
                                   Interpretation obligatoire
                               </p>
                           </div>
                       </div>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_radiologie.$invalid" ng-click="save(form_radiologie,true);" name="ok" class="btn btn-success">Enregistrer</button>
                               
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
      <div class="panel-heading font-bold"> RADIOLOGIE : Liste des candidats en attente de resultats ( {{ total}})</div>
      <div class="panel-body">

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