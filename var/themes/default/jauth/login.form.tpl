{meta_html css 'http://fonts.googleapis.com/css?family=Dosis:400,300,200,500,600,700,800'}
{meta_html css '/packages/bootstrap/dist/css/bootstrap.css'}
{meta_html css '/packages/fontawesome/css/font-awesome.min.css'}
{meta_html css '/asset/js/tools/angular/toastr/toastr.min.css'}
{meta_html css '/asset/css/styles.css'}
{meta_html css '/packages/flexslider/flexslider.css'}
{meta_html css '/packages/owl-carousel/owl.carousel.css'}
{meta_html css '/packages/owl-carousel/owl.theme.css'}
{meta_html bodyattr array('ng-app'=>'auth', 'ng-controller'=>'LoginController', 'ng-cloak'=>'')}

<div class="container">
	
	<!-- login section -->
	<section id="section-login">
		<div class="logo">
			<a href="/">
				<img src="/asset/img/logo-login.png" alt="">
			</a>
		</div>
		<div class="or hidden-sm hidden-xs">
					OU
		</div>
		<div class="row">

			<div class="col-lg-6">
				<!-- register -->
				<div class="register" ng-controller="InscriptionController">
					<h3>Inscription</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea consectetur dolorem, enim explicabo necessitatibus, eius, dolores iure corporis adipisci tempora voluptatibus officia. Beatae perspiciatis possimus, quos nemo exercitationem reiciendis, odio!</p>
					<form novalidate  action="{jurl 'user~user:create'}" method="post" name="form_user" id="form_user">
						
						<div class="row">
							<div class="col-lg-6 mb-20">
								<label for="user_lastname">Nom</label>
                                                                <input type="text" name="lastname" required ng-model="user.lastname" id="user_lastname">
								<span ng-show="isInvalid('lastname')" class="errors-form"> Nom obligatoire </span>
							</div>
							<div class="col-lg-6 mb-20">
								<label for="user_firstname">Prenom</label>
								<input type="text" name="firstname" ng-model="user.firstname" id="user_firstname">
								<span ng-show="isInvalid('firstname')" class="errors-form"> Prenom obligatoire </span>
							</div>
							<div class="col-lg-12 mb-20">
								<label for="user_email">Adresse electronique</label>
								<input type="email" name="email" ng-model="user.email" id="user_email">
								<span ng-show="isInvalid('email')" class="errors-form"> e-mail invalide </span>
							</div>
							<div class="col-lg-12 mb-20">
								<label for="user_password">Mot de passe</label>
								<input type="password" name="password" ng-model="user.password" id="user_password">
								<span ng-show="isInvalid('password')" class="errors-form"> Mot de passe obligatoire </span>
							</div>
                                                        <div class="col-lg-12 mb-20">
								<label for="user_cpassword">Confirmer mot de passe</label>
								<input type="password" name="cpassword" ng-model="user.cpassword" id="user_cpassword">
								<span ng-show="isInvalid('cpassword')" class="errors-form">Confirmation mot de passe obligatoire </span>
                                                                <span ng-show="(user.cpassword !=user.password)" class="errors-form">Mots de passes diff&eacute;rernts </span>
							</div>
							<div class="col-lg-4">
                                                            <button ng-disabled="form_user.$invalid || (user.cpassword !=user.password)" class="btn btn-primary">Inscription</button>
							</div>
							<div class="col-lg-8">
								<input type="checkbox" ng-model="user.condition" required name="condition"> J'accepte les <a href="#">conditions d'utilisation</a>
								<br>
								<span ng-show="isInvalid('cpassword')" class="errors-form">Veuillez accepter les conditions d'utilisation </span>
							</div>
						</div>
					</form>
				</div>
				<!-- end -->
			</div>

			<div class="col-lg-6">
				<!-- login -->
				<div class="login" ng-controller="ConnexionController">
					<h3>Connexion</h3>
					{if $failed}
                                        <div class="row">
                                            <div class="col-xs-12 form-group">
                                                   <div class="alert alert-error">{@jauth~auth.failedToLogin@}</div>

                                            </div>
                                        </div>
                                        {/if}
					<form  novalidate action="{jurl 'jauth~login:in'}" method="post" name="formLogin" id="formLogin">
                                            {literal}
						<div class="row">
							<div class="col-lg-12 mb-20">{/literal}
								<label for="formLogin_email">Adresse &eacute;lectronique</label>
                                                                <input type="email" name="login"  autocomplete="off" required ng-model="formLogin.email" id="formLogin_email" value="{$login|eschtml}">
                                                                <span ng-show="isInvalid('login')" class="errors-form">Adresse &eacute;lectronique invalide </span>
							</div>{literal}
							<div class="col-lg-12 mb-20">
								<label for="formLogin_password">Mot de passe</label>
								<input type="password" required  autocomplete="off" name="password" ng-model="formLogin.password" id="formLogin_password">
                                                                <span ng-show="isInvalid('password')" class="errors-form">Mot de passe invalide </span>
							</div>
							<div class="col-lg-5">
								<button  ng-disabled="formLogin.$invalid" class="btn btn-primary"> Connexion </button>
							</div>
                                                        <div class="col-lg-6 " >
                                                            <label style="">
                                                                <input type="checkbox"  name="rememberMe" value="true"> Se souvenir de moi
                                                            </label> 
							</div>
						</div> {/literal}
                                            {if !empty($auth_url_return)}
                                                <input type="hidden" name="auth_url_return" value="{$auth_url_return|eschtml}" />
                                            {/if}       
					</form>
                                        <div class="row">
                                                <div class="col-lg-12">
                                                    <a href="{jurl 'user~default:lostPass'}"> mot de passe oublié ? </a>
                                                </div>
                                        </div> 
				</div>
				<!-- end -->
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
{meta_html js '/packages/jquery/dist/jquery.js'}
{meta_html js '/asset/js/angular/angular.min.js'}
{meta_html js '/asset/js/angular/i18n/angular-locale_fr-ci.js'}

<script src="/asset/js/app/controllers/login.js"></script>