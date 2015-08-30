{meta_html css '/trumed/www/styles/sb-admin/css/bootstrap.min.css'}
{meta_html css '/trumed/www/styles/css/connexion.css'}

    <div class="container">
        
        {if $failed}
           <div class="alert alert-danger form-signin">{@jauth~auth.failedToLogin@}</div>
        {/if}
        
      {if ! $isLogged} 
          
      <form class="form-signin" role="form" action="{jurl 'jauth~login:in'}" method="post">
        <img src="/trumed/www/images/logo.png"/>
        <h2 style="text-align: center;">...</h2>
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
      </form>
     {else}
            <p>{$user->login} | <a href="{jurl 'jauth~login:out'}" >{@jauth~auth.buttons.logout@}</a></p>
     {/if}
    </div> 