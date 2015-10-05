{zone 'link~header'}
{*meta_html bodyattr array('ng-app'=>'dfBrowser')*}
{*meta_html css '/favoris/www/js/tools/angular/ng-table/ng-table.min.css'*}
{meta_html css '/favoris/www/styles/default/css/browser.css'}
{*<iframe class="browser-frame" src="{$record->url}" width="100%" height="100%" frameborder="0" noresize="noresize">
        
</iframe>  *}
<input id="link_url" type="hidden" value="{$record->url}">
<iframe id="main-browser" class="browser-frame" src="{jurl 'browser~default:read',array('id'=>$record->id)}" width="100%" height="100%" frameborder="0" noresize="noresize"></iframe>    

{include 'link~footer'}
{*
<script src="{jrooturl ''}www/js/tools/angular/bootstrapui/ui-bootstrap-0.11.0.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/angular/angular-route.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/tools/angular/ng-table/ng-table.min.js" type="text/javascript"></script>
*}
<script src="{jrooturl ''}www/js/app/browser-setting.js" type="text/javascript"></script> 
