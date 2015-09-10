{zone 'link~header'}
{meta_html bodyattr array('ng-app'=>'dfBrowser')}
{meta_html css '/favoris/www/js/tools/angular/ng-table/ng-table.min.css'}
{literal} 
    <iframe width="100%" height="650" ng-src="{{link.url}}">
        
    </iframe>        
{/literal}
{include 'link~footer'}
<script src="{jrooturl ''}www/js/tools/angular/bootstrapui/ui-bootstrap-0.11.0.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/angular/angular-route.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/tools/angular/ng-table/ng-table.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/app/controllers/browser.js" type="text/javascript"></script>
