 Link
 {literal}
 <div class="col-md-12">

                        <h2>Favorites</h2>
                        <br/>
                        <div class="table-responsive">
                            <table ng-table="tableParams" show-filter="true" class="table table-bordered table-hover">

                                <tbody>
                                    <tr ng-repeat="row in $data">
                                        <td data-title="'#'">
                                            <input type="checkbox"  ng-model="row.checked" value="{{row.id}}" name="tbItems[]">
                                        </td>
                                        <td data-title="'Titre'" filter="{ 'title': 'text' }" sortable="'title'">
                                            {{row.title}}
                                        </td>
                                        <td data-title="'URL'">
                                           <a href="#/browser/{{row.id}}"> {{row.url}}</a>
                                       </td>
                                       <td data-title="'Action'"  >
                                           <button type="button" ng-click="edit($index)" title="Modifier" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-pencil"></span> 
                                            </button> 
                                           <button type="button" ng-click="remove(row.id)" title="Modifier" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span> 
                                            </button> 
                                      </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                                                 
                        </div>
                        

    
</div>
{/literal}