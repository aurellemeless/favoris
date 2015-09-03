{zone 'link~header'}
{meta_html bodyattr array('ng-app'=>'df')}

<!-- end space1 -->
    <div class="container">
        <div class="row">
        
           {literal} 
            <div class="col-md-12" ng-view>
                
            </div>
        </div>
    </div>

{/literal}
{include 'link~footer'}
<script src="{jrooturl ''}www/js/tools/angular/bootstrapui/ui-bootstrap-0.11.0.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/angular/angular-route.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/app/controllers/favorite.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/app/controllers/link.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/app/controllers/link-add.js" type="text/javascript"></script>