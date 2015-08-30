{ifright 'visite.candidat.edit'}
{literal}

<div class="col-md-12">
    <a href="#/candidat" class="btn btn-success"><span class="glyphicon glyphicon-list"></span> Liste </a>
</div>

<div class="col-md-12" ng-show="!list">
    <div class="row">
             <div class="col-md-6">
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
                     <fieldset><legend> <span class="glyphicon glyphicon-group"> </span>RESULTAT :  BIOCHIMIE SANGUINE </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="creatinine_candidat">Creatinine </label>
                               <input type="text" ng-model="candidat.creatinine" name="creatinine" class="form-control" id="creatinine_candidat">
                               
                           </div>
                       </div>
                       
                     </fieldset>

                     <fieldset><legend> <span class="glyphicon glyphicon-group"> </span>RESULTAT : RADIOLOGIE </legend>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="radio_candidat">Poumon Face </label>
                               <textarea  ng-model="candidat.radio" name="radio" class="form-control" id="radio_candidat"></textarea>
                               
                           </div>
                       </div>
                       
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_candidat.$invalid" ng-click="save(form_candidat,true);" name="ok" class="btn btn-primary">Enregistrer</button>
                               
                               <a href="#/candidat" class="btn btn-default">Quitter</a>
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
{/ifright}