{meta_html css $rootUrl.'www/styles/sb-admin/css/bootstrap.min.css'}
{meta_html css $rootUrl.'www/styles/css/connexion.css'}

    <div class="container">
        
        

        <div class="col-md-offset-3 col-md-6 col-sm-6 col-xs-6" style="padding-top:80px;">    

          <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-bars"></i>
                </span>
                <div class="text-box" >
                    


                  {if $failed}
                       <div class="alert alert-danger form-signin">{@jauth~auth.failedToLogin@}</div>
                    {/if}
                    
                  {if ! $isLogged} 
                      
                  <form class="form-signin" role="form" action="{jurl 'user~login:in'}" method="post">
                    <img src="{$rootUrl}www/images/logo.png"/>
                    <input type="text" class="form-control" name="login" autocomplete="off" placeholder="nom d'utilisateur" required autofocus>
                    <input type="password" class="form-control" name="password" placeholder="Mot de passe" required>
                   {if $showRememberMe}
                        <label class="checkbox" for="rememberMe">{@jauth~auth.rememberMe@}
                         <input  type="checkbox" name="rememberMe" id="rememberMe" value="1" /></label>
                   {/if}           
                        
                    <button class="btn btn-lg btn-success btn-block" type="submit">connexion</button>
                    
                   {if !empty($auth_url_return)}
                        <input type="hidden" name="auth_url_return" value="{$auth_url_return|eschtml}" />
                   {/if}
                   <p style="margin-top:20px;text-align:center;"> DF &copy EMNIS 2015</a></p>
                  </form>
                 {else}
                        <p>{$user->login} | <a href="{jurl 'user~login:out'}" >{@jauth~auth.buttons.logout@}</a></p>
                 {/if}



                </div>
          </div>
         </div>



    </div> 