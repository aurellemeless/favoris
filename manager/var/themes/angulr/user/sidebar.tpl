{ifright 'user.home'}
<li>
    
    <a href class="auto">      
          <span class="pull-right text-muted">
            <i class="fa fa-fw fa-angle-right text"></i>
            <i class="fa fa-fw fa-angle-down text-active"></i>
          </span>
          <i class="fa fa-fw fa-users icon text-primary-dker"></i>
          <span class="font-bold">UTILISATEURS</span>
    </a>
    
  <ul class="nav nav-sub dk">
        <li class="nav-sub-header">
            <a href><span>UTILISATEURS</span></a>
        </li>
        {ifright 'user.group.read'}
        <li>
            <a href="#/user-group"><span>Groupes</span></a>
        </li>
        {/ifright}
        {*<li>
            <a href="#/user-role"><span>Roles</span></a>
        </li>*}
        {ifright 'user.feature.read'}
        <li>
            <a href="#/user-feature"><span>Ressources</span></a>
        </li>
        {/ifright}
        <li>
            <a href="#/user-user"><span>Utilisateurs</span></a>
        </li>
       {* {ifright 'user.employee.read'}
        <li>
            <a href="#/user-employee"><span>Employ&eacute;s</span></a>
        </li>
        {/ifright}*}
    </ul>
</li>
{/ifright}