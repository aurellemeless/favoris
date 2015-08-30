
{literal}



<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3"> Gestion des Candidats</h1>
</div>

<div class="col-md-12">
    
</div>

<div class="col-md-12" ng-show="!list">
    


    <div class="panel panel-default">
      <div class="panel-heading font-bold">Details du candidat</div>
      <div class="panel-body">
        

         <div class="col-md-6">
                <button class="btn btn-success" ng-show="!list"  ng-click="list=!list"><span class="glyphicon glyphicon-list"></span> Liste</button>
                {/literal}{ifright 'visite.candidat.edit'}{literal}
                <a  href="#/candidat/{{ candidat.id }}"  ng-show="!list" title="Modifier le resultat" class="btn btn-danger">
                    <span class="glyphicon glyphicon-pencil"></span> Modifier
                </a>
                {/literal}{/ifright}{literal}
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_candidat"  method="post" role="form" id="form_candidat">
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
                                  <th>Nom & Prenom </th><td> {{candidat.nom + ' '+candidat.prenom }} </td>
                                </tr>
                                <tr>
                                  <th>Date de Naissance </th><td> {{candidat.ddn}}</td>
                                </tr>
                                <tr>
                                  <th>Lieu de Naissance </th><td> {{candidat.ln}}</td>
                                </tr>
                                <tr>
                                  <th>Concour </th><td> {{candidat.concour}}</td>
                                </tr>
                              </table>
                           </div>

                       </div>
                    </fieldset>
                    <fieldset><legend> <span class="glyphicon glyphicon-group"> </span>LABORATOIRE : BIOCHIMIE SANGUINE </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label> Creatinine : </label>
                               <span> {{candidat.creatinine}} </span>
                           </div>
                       </div>
                       
                     </fieldset>
                      <fieldset><legend> <span class="glyphicon glyphicon-group"> </span>RADIOLOGIE : RADIO POUMON FACE </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label> Interpretation : </label>
                               <span> {{candidat.radio}} </span>
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
                        
                        <br/>

                     
                 <div class="panel panel-default">
                    <div class="panel-heading font-bold">EXAMENS : Liste des Candidats ( {{ total}})</div>
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
                                        <td data-title="'Date de naissance'" sortable="'ddn'">
                                          {{ row.ddn}}
                                        </td>
                                        <td>
                                            <button type="button" ng-click="edit($index)" title="Saisir le resultat" class="btn btn-success">
                                                <span class="glyphicon glyphicon-list"></span> Resultat
                                            </button> 
                                            {/literal}{ifright 'visite.candidat.edit'}{literal}
                                            <a  href="#/candidat/{{ row.id }}" title="Modifier le resultat" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-pencil"></span> Modifier
                                            </a>
                                            {/literal}{/ifright}{literal}
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                                                 
                        </div>

                  </div>
              </div>
                        

    
</div>

{/literal}