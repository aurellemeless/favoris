<?php 
if (jApp::config()->compilation['checkCacheFiletime'] &&
filemtime('C:\wamp\www\df/modules/link/templates/about.tpl') > 1440889190){ return false;
} else {
function template_meta_32b6b68632e30747da5db8c1436e54e9($t){
$t->meta('header');
$t->meta('footer');

}
function template_32b6b68632e30747da5db8c1436e54e9($t){
?><?php $t->display('header');?>
<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Welcome to Do Favorite</h1>
        <p>The best tool when you want to save your prefered links.</p>
        
      </div>

    </div> <!-- /container -->
<?php $t->display('footer');?><?php 
}
return true;}
