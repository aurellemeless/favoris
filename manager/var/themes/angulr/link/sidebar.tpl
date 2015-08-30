{ifright 'user.home'}
<li>
    
    <a href class="auto">      
          <span class="pull-right text-muted">
            <i class="fa fa-fw fa-angle-right text"></i>
            <i class="fa fa-fw fa-angle-down text-active"></i>
          </span>
          <i class="fa fa-fw fa-users icon text-primary-dker"></i>
          <span class="font-bold">LIENS</span>
    </a>
    
  <ul class="nav nav-sub dk">
        <li class="nav-sub-header">
            <a href><span>LIENS</span></a>
        </li>
        {ifright 'user.group.read'}
        <li>
            <a href="#/category"><span>Categories</span></a>
        </li>
        {/ifright}
        {*<li>
            <a href="#/user-role"><span>Roles</span></a>
        </li>*}
        {ifright 'user.feature.read'}
        <li>
            <a href="#/link"><span>liens</span></a>
        </li>
        {/ifright}
    </ul>
</li>
{/ifright}