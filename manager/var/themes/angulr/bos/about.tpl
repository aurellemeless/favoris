
<div style="min-height:650px;background: url();">
    
    <div class="row">
        <div class="col-md-6" >
            <h3> Informations de votre installation TRUMED </h3>
           
            <ul>
                <li>
                     <h4> Environnement TRUMED  </h4>
                    <table>
                        <tbody>
                            <tr>
                                <th> Version </th>
                                <td>: {$bos['version']}</td>
                            </tr>
                            <tr>
                                <th> Date </th>
                                <td>: {$bos['date']}</td>
                            </tr>
                        </tbody>
                    </table>
                </li>
                <li>
                     <h4> Environnement PHP </h4>
                </li>
            </ul>
            
        </div>
        <div class="col-md-6" >
            <button class="btn btn-success btn-lg center-block" ng-click="update()"> <span  class="glyphicon glyphicon-refresh">
                
                </span> Mettre à jour TRUMED </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" >
            <img src="/trumed/www/images/system.png" height="139" class="center-block"/>
        </div>
    </div>
</div>
