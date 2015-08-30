<?php 
if (jApp::config()->compilation['checkCacheFiletime'] &&
filemtime('C:\wamp\www\df/modules/link/templates/footer.tpl') > 1440887235){ return false;
} else {
 require_once('C:\wamp\www\df\lib\jelix/plugins/tpl/html/function.jrooturl.php');
function template_meta_8eb323e3cd6ff80602d6ee139a03ad76($t){

}
function template_8eb323e3cd6ff80602d6ee139a03ad76($t){
?>

<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<?php jtpl_function_html_jrooturl( $t);?>www/styles/default/js/jquery.js"></script>
    <script src="<?php jtpl_function_html_jrooturl( $t);?>www/styles/default/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<?php jtpl_function_html_jrooturl( $t);?>www/styles/default/js/ie10-viewport-bug-workaround.js"></script><?php 
}
return true;}
