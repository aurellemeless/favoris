{ifright 'user.home'}
<li>
    <a href="javascript:;" data-toggle="collapse" data-target="#droits">
      <i class="fa fa-fw fa-users"></i> UTILISATEURS <i class="fa fa-fw fa-caret-down"></i>
    </a>
    
  <ul id="droits" class="collapse">
        {ifright 'user.group.read'}
        <li>
            <a href="#/user-group">Groupes</a>
        </li>
        {/ifright}
        {*<li>
            <a href="#/user-role">Roles</a>
        </li>*}
        {ifright 'user.feature.read'}
        <li>
            <a href="#/user-feature">Ressources</a>
        </li>
        {/ifright}
        <li>
            <a href="#/user-user">Utilisateurs</a>
        </li>
       {* {ifright 'user.employee.read'}
        <li>
            <a href="#/user-employee">Employ&eacute;s</a>
        </li>
        {/ifright}*}
    </ul>
</li>
{/ifright}