{literal}
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">Gestion des extensions</h1>
</div>
<div class="col-md-12">
    <br>
    <div class="panel panel-default">
            <div class="panel-heading"> </div>
            <div class="panel-body">
             
                <div class="col-md-6">
                    <div class="">
                        <form novalidate  enctype="multipart/form-data"   name="form_app"  method="post" role="form" id="form_app">
                        <br/><br/>
                        <fieldset><legend> <span class="glyphicon glyphicon-import"> </span>  Installer une extension </legend>

                           <div class="row">
                               <div class="col-xs-6 form-group">
                                   <label for="archive_app"> Fichier </label>
                                   <input type="file" ng-model="app.archive" name="archive" class="form-control" id="archive_app">
                               </div>
                               <div class="col-xs-2 form-group"><br/>
                                   <button type="button" ng-disabled="form_app.$invalid" ng-click="install(form_app);" name="ok" class="btn btn-lg btn-success">
                                       <span class="glyphicon glyphicon-import"></span> Installer </button>
                                   
                               </div>
                           </div>

                        </fieldset>
                        </form>

                    </div>

                </div>

        <!-- liste -->
            <div class="col-md-12">

                        <h3>Liste des extensions installés</h3>
                        <br/>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nom</th>
                                        <th>Version</th>
                                        <th>Description</th>
                                        <th>Auteur</th>
                                        <th>Dependences</th>
                                        <th>Date de creation</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="row in apps">

                                        <td>
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.info.attributes.name}}" name="tbItems[]">
                                        </td>
                                        <td>{{ row.info.label }}</td>
                                        <td>{{ row.info.version}}</td>
                                        <td> 
                                            License : {{ row.info.license}} <br>
                                            Copyright : {{ row.info.copyright}} <br>
                                        </td>
                                        <td> 
                                            Nom : {{ row.info.creator.attributes.name}} <br>
                                            E-mail : {{ row.info.creator.attributes.email}} <br>
                                          <!--  Commentaire : {{ row.info.comment}} <br> -->
                                            site : {{ row.info.homepageURL}} <br>
                                        </td>
                                        <td> 
                                            Jelix : {{ row.dependencies.jelix.attributes.minversion }} - {{ row.dependencies.jelix.attributes.maxversion }} <br>
                                        </td>
                                        <td> 
                                            {{ row.info.attributes.createdate}} <br>
                                        </td>
                                        <td>
                                            <a href="#/extension-param/{{row.info.attributes.name}}"  title="Paramètres" class="btn btn-primary">
                                                <span class="fa fa-fw fa-gear"></span> 
                                            </a> 
                                             <button type="button" ng-click="uninstall($index)" title="Désinstaller" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-trash"></span> 
                                            </button><!--  -->
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                        </div>



                </div>


            </div>
    </div>
</div>

         
{/literal}