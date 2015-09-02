{meta_html css '/favoris/www/styles/default/css/bootstrap.min.css'}
{meta_html css '/favoris/www/styles/default/css/navbar-fixed-top.css'}
{meta_html js '/favoris/www/styles/default/js/ie-emulation-modes-warning.js'}


{zone 'link~header'}
{meta_html bodyattr array('ng-app'=>'auth', 'ng-controller'=>'LoginController', 'ng-cloak'=>'')}

<div class="container">
	
	<!-- login section -->
	<section id="section-login">
		<div class="logo">
			<a href="/">
				<img src="" alt="LOGO">
			</a>
		</div>
		
		<div class="row">

			
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
							<div class="col-lg-12">{/literal}
								<label for="formLogin_email">E-mail</label>
                                                                <input type="email" name="login" class="form-control" required ng-model="formLogin.email" id="formLogin_email" value="{$login|eschtml}">
                                                                <span ng-show="isInvalid('login')" class="errors-form">Adresse &eacute;lectronique invalide </span>
							</div>{literal}
							<div class="col-lg-12">
								<label for="formLogin_password">Mot de passe</label>
								<input type="password" required  class="form-control" name="password" ng-model="formLogin.password" id="formLogin_password">
                                                                <span ng-show="isInvalid('password')" class="errors-form">Mot de passe invalide </span>
							</div>
							
                                                        <div class="col-md-4 " >
                                                            <br/>
                                                            <label style="">
                                                                <input type="checkbox"  name="rememberMe" value="true"> Rester connect&eacute;
                                                            </label> 
							</div>
                                                        
                                                        <div class="col-md-3">
                                                            <br/>
								<button  ng-disabled="formLogin.$invalid" class="btn btn-primary btn-lg"> Connexion </button>
							</div>
                                                        
						</div> {/literal}
                                            {if !empty($auth_url_return)}
                                                <input type="hidden" name="auth_url_return" value="{$auth_url_return|eschtml}" />
                                            {/if}       
					</form>
                                        <div class="row">
                                                <div class="col-lg-12">
                                                    <br>
                                                    <a href="{jurl 'user~default:lostPass'}"> mot de passe oubli&eacute; ? </a>
                                                </div>
                                        </div> 
				</div>
				<!-- end -->
			</div>

		</div>
                                        
	</section>
	<!-- end.login section -->


</div>
{include 'link~footer'}
<script src="{jrooturl ''}www/js/tools/angular/bootstrapui/ui-bootstrap-0.11.0.min.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/app/controllers/inscription.js" type="text/javascript"></script>
<script src="{jrooturl ''}www/js/app/controllers/login.js"></script>