{meta_html css 'http://fonts.googleapis.com/css?family=Dosis:400,300,200,500,600,700,800'}
{meta_html css '/packages/bootstrap/dist/css/bootstrap.css'}
{meta_html css '/packages/fontawesome/css/font-awesome.min.css'}
{meta_html css '/asset/js/tools/angular/toastr/toastr.min.css'}
{meta_html css '/asset/css/styles.css'}
{meta_html css '/packages/flexslider/flexslider.css'}
{meta_html css '/packages/owl-carousel/owl.carousel.css'}
{meta_html css '/packages/owl-carousel/owl.theme.css'}
{meta_html bodyattr array('ng-app'=>'shop', 'ng-controller'=>'ShopController')}

<div class="container">
	
	<!-- login section -->
	<section id="section-login">
		<div class="logo">
			<a href="/gouabo/">
				<img src="/asset/img/logo-login.png" alt="">
			</a>
		</div>
		
		<div class="row">

			<div class="col-lg-6">
				{$message}
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
				<a href="">Mentions légales</a>
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
				Tous les droits réservés gouabo 2015 created by <a href="">Numerika group</a>
			</li>
		</ul>
	</footer>

</div>
<script src="/packages/jquery/dist/jquery.js"></script>
<script src="/asset/js/angular/angular.js"></script>