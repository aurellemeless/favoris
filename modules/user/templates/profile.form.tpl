<div id="form_user_wrapper">
<form action="" method="post" enctype="multipart/form-data" name="form_user" id="form_user">
    <fieldset><legend>Gestion de profile</legend>
      <table width="700" class="table">
        <tr>
          <td width="112"><label for="lastname_user">Nom : </label></td>
          <td width="342"><input type="text" name="lastname" id="lastname_user"
                               value="{$user->lastname}"
                           required validationMessage="saisir nom"/></td>
        </tr>
        <tr>
          <td width="112"><label for="firstname_user">Prenom : </label></td>
          <td width="342"><input type="text" name="firstname" id="firstname_user"
                                 value="{$user->firstname}"
                           required validationMessage="saisir prenom"/></td>
        </tr>
       
        <tr>
          <td width="112"><label for="login_user">Login : </label></td>
          <td width="342">{$user->login}</td>
        </tr>
        <tr>
          <td width="112"><label for="password_user">Mot de passe : </label></td>
          <td width="342"><input type="password" name="password" id="password_user"
                                required validationMessage="saisir mot de passe" /></td>
        </tr>
        <tr>
          <td width="112"><label for="cpassword_user">Confirmer mot de passe : </label></td>
          <td width="342"><input type="password" name="cpassword" id="cpassword_user"
                                 required validationMessage="confirmer mot de passe"/></td>
        </tr>
        <tr>
          <td width="112"><label for="email_user">E-mail : </label></td>
          <td width="342"><input type="text" name="email" id="email_user" 
                                value="{$user->email}" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="button" onclick="saveUser();" class="k-button" name="btn_ok" id="btn_ok" value="Enregistrer" />
        </tr>
      </table>
        <input type="hidden" name="id" id="user_id" value="0" />
    </fieldset> 
</form>
<script type="text/javascript" src="js/app/user/profile.js"></script>
</div>