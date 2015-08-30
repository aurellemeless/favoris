{literal}
<div class="row">
     <div class="col-md-12">

            <h3>Affectation des ressources du groupe <span class="text-success"> {{ group.title }} </span></h3>
            <hr>
    </div>
    <div class="col-md-6">

                            <h4>ressources</h4>
                            <button type="button" ng-click="addAll()" title="Ajouter" class="btn btn-primary">
                                Ajouter <span class="glyphicon glyphicon-forward"></span> 
                            </button> <br/><br/>
                            <div class="table-responsive">
                                <table ng-table="featuresTableParams" show-filter="true"  class="table  table-bordered table-hover ng-table-responsive">
                                    
                                    <tbody>
                                        <tr ng-repeat="row in $data">

                                            <td>
                                                <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                            </td>
                                            <td>{{ row.id }}</td>
                                            <td  data-title="'Code'" filter="{'title':'text'}">{{ row.title}}</td>
                                            <td  data-title="'Description'" filter="{'description':'text'}">{{ row.description }}</td>
                                            <td>
                                                <button type="button" ng-click="add(row.id)" title="Ajouter" class="btn btn-primary">
                                                    <span class="glyphicon glyphicon-forward"></span> 
                                                </button> 
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>

                            </div>



    </div>
    
    <div class="col-md-6">
        
                            <h4>ressources du groupe</h4>
                            <button type="button" ng-click="removeAll()" title="Retirer" class="btn btn-primary">
                                Retirer <span class="glyphicon glyphicon-backward"></span> 
                            </button> <br/><br/>
                            <div class="table-responsive">
                                <table  ng-table="groupfeaturesTableParams" show-filter="true"  class="table  table-bordered table-hover ng-table-responsive">
                                    
                                    <tbody>
                                        <tr ng-repeat="row in $data">
                                            <td>
                                                <button type="button" ng-click="remove({{ row.feature_id }})" title="Retirer" class="btn btn-primary">
                                                    <span class="glyphicon glyphicon-backward"></span> 
                                                </button> 
                                            </td>
                                            <td>
                                                <input type="checkbox"  ng-model="row.checked" value="{{row.feature_id}}">
                                            </td>
                                            <td  data-title="'code'" >{{ row.feature_title}}</td>
                                            <td data-title="'Description'" >{{ row.feature_description }}</td>
                                            
                                        </tr>

                                    </tbody>
                                </table>

                            </div>
    </div>

</div>
{/literal}