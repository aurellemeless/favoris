<?php 
if (jApp::config()->compilation['checkCacheFiletime'] &&
filemtime('C:\wamp\www\df/modules/link/templates/header.tpl') > 1440889264){ return false;
} else {
 require_once('C:\wamp\www\df\lib\jelix/plugins/tpl/html/function.jrooturl.php');
 require_once('C:\wamp\www\df\lib\jelix/plugins/tpl/html/function.jurl.php');
function template_meta_0380911306ebc04090d352605780b3a4($t){

}
function template_0380911306ebc04090d352605780b3a4($t){
?>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<?php jtpl_function_html_jrooturl( $t);?>">Do Favorite</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<?php jtpl_function_html_jrooturl( $t);?>">Home</a></li>
            <li><a href="<?php jtpl_function_html_jurl( $t,'link~default:about');?>">About</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
                <li><a href="<?php jtpl_function_html_jurl( $t,'user~user:inscription');?>">Inscription <span class="sr-only">(current)</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav><?php 
}
return true;}
