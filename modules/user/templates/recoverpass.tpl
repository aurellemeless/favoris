{meta_html css 'http://fonts.googleapis.com/css?family=Dosis:400,300,200,500,600,700,800'}
{meta_html css '/packages/bootstrap/dist/css/bootstrap.css'}
{meta_html css '/packages/fontawesome/css/font-awesome.min.css'}
{meta_html css '/asset/js/tools/angular/toastr/toastr.min.css'}
{meta_html css '/asset/css/styles.css'}
{meta_html css '/packages/flexslider/flexslider.css'}
{meta_html css '/packages/owl-carousel/owl.carousel.css'}
{meta_html css '/packages/owl-carousel/owl.theme.css'}
{meta_html bodyattr array('ng-app'=>'auth', 'ng-controller'=>'LoginController')}

{meta_html js 'https://www.google.com/recaptcha/api.js'}

<div class="container">
	
	<!-- login section -->
	<section id="section-login">
		<div class="logo">
			<a href="/">
				<img src="/asset/img/logo-login.png" alt="">
			</a>
		</div>
		
		<div class="row">

			<div class="col-lg-12">
				<!-- BEGIN .panel -->
                                    <div class="panel">


                                        <div id="titre">
                                                <h3 class="page-header"> <i class="glyphicon glyphicon-share-alt"></i> REINITIALISATION DE VOTRE MOT DE PASSE..</h3>  


                                                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="margin: 0 auto !important;">
                                                        <form id="form_pass" role="form" name="form_pass" method="post" action="{jurl 'user~default:changePassword'}">
                                                            {if $MESSAGE}
                                                                <div class="col-md-8 alert alert-danger">{$MESSAGE} </div>
                                                            {else}
                                                            <div class="col-md-8 form-group">
                                                                <label for="email" class="text-left">Votre e-mail :</label>
                                                                <input type="text" class="form-control" required name="email" id="email" />
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <label for="email" class="text-left"></label>
                                                                <div class="g-recaptcha" data-sitekey="{$sitekey}"></div>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="submit" class="btn btn-primary btn-lg" name="valider" value="Reinitialiser mot de passe" />
                                                            </div>
                                                             {/if}
                                                        </form>

                                                    </div>   



                                            </div>
                                        <!-- END .panel -->
                                    </div>
			</div>

		</div>
                                        
	</section>
	<!-- end.login section -->

	<!-- login footer -->
	<footer id="login-foot" class="hidden-sm hidden-xs">
		<ul>
			<li>
				<a href="">Condition d'utilisation</a>
			</li>
			<li>
				<a href="">Mentions l&eacute;gales</a>
			</li>
			<li>
				<a href="">Partenariat</a>
			</li>
			<li>
				<a href="">Cookies</a>
			</li>
			<li>
				<a href="">A propos</a>
			</li>
			<li>
				<a href="">Contact</a>
			</li>
			<li>
				Tous les droits r&eacute;serv&eacute;s gouabo 2015 created by <a href="">Numerika group</a>
			</li>
		</ul>
	</footer>

</div>
<script src="/packages/jquery/dist/jquery.js"></script>
<script src="/asset/js/angular/angular.js"></script>
