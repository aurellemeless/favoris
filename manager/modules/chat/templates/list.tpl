{literal}

<div class="col-md-12">
   <a href="#/chat-add" class="btn btn-success">Nouveau</a>
</div>

<!-- Liste -->


                        <div class="col-md-12">
                            <h2>Messages internes</h2>
                        </div>
                        <br/>
                        <div class="col-md-12 table-responsive">
                            <table ng-table="tableParams" show-filter="true"  class="table  table-bordered table-hover ng-table-responsive">
                                <tbody>
                                    <tr ng-repeat="row in $data"  >
                                        
                                        <td data-title="'Nom'"  filter="{ 'lastname': 'text' }" sortable="'lastname'">
                                            {{ row.lastname }}
                                        </td>
                                        <td data-title="'Prenom'" filter="{ 'firstname': 'text' }" sortable="'firstname'">
                                            {{ row.firstname}}
                                        </td>
                                        
                                        <td data-title="'Message'" filter="{ 'content': 'text' }"">
                                            {{ row.content}}
                                        </td>
                                        <td>
                                            <a href="#/chat-view/{{ row.id }}" title="Lire" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>


{/literal}
