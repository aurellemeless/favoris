<?php 
if (jApp::config()->compilation['checkCacheFiletime'] &&
filemtime('C:\wamp\www\df/modules/link/templates/main.tpl') > 1440888036){ return false;
} else {
function template_meta_93a4dc70050aa1f535d0847e30fbe540($t){
$t->meta('header');
$t->meta('footer');

}
function template_93a4dc70050aa1f535d0847e30fbe540($t){
?><?php $t->display('header');?>
<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Welcome to Do Favorite</h1>
        <p>The best tool when you want to save your prefered links.</p>
        <p>
          <a class="btn btn-lg btn-primary" href="#" role="button">Sign in now &raquo;</a>
        </p>
      </div>

    </div> <!-- /container -->
<?php $t->display('footer');?><?php 
}
return true;}
