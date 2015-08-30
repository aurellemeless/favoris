{*meta_html css 'http://fonts.googleapis.com/css?family=Dosis:400,300,200,500,600,700,800'*}
{meta_html css $rootUrl.'www/styles/sb-admin/css/bootstrap.css'}
{meta_html css $rootUrl.'www/styles/sb-admin/js/plugins/custom-scrollbar/jquery.mCustomScrollbar.min.css'}
{meta_html css $rootUrl.'www/styles/sb-admin/css/sb-admin.css'}
{meta_html css $rootUrl.'www/styles/sb-admin/font-awesome-4.3.0/css/font-awesome.min.css'}
{meta_html js $rootUrl.'www/styles/sb-admin/js/plugins/metisMenu/src/metisMenu.js'}

{foreach $js_head_files as $f}
    {meta_html js $f}
{/foreach}
{meta_html bodyattr array('ng-app'=>'bos')}
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Basculer navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/trumed/"> Visite Medicale | TRUMED </a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        {foreach $messages as $message}
                        <li class="message-preview">
                            <a href="#/chat-view/{$message->id}">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>{$message->lastname} {$message->firstname}</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> {$message->createdate}</p>
                                        <p>{$message->content|truncate:150} ...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        {/foreach}
                        <li class="message-footer">
                            <a href="#/chat-list">Lire Tous Les Nouveaux Messages</a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> {$user->firstname} {$user->lastname} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#/user-profile"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                    </ul>
                </li>
				<li>
					<a href="{jurl 'jauth~login:out'}"><i class="fa fa-fw fa-power-off"></i> D&eacute;connexion </a>
				</li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div id="side-menu-wrapper" class="collapse navbar-collapse side-nav">
                
                    <ul id="side-menu" class="nav navbar-nav ">
                        {foreach $menus as $mod}
                           {$mod}
                        {/foreach}
                        </li>
                    </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row" id="workspace">
                    <div class="col-md-12" ng-view>

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript     -->  
<script src="{jurl 'bos~default:extensionsConfig'}"></script>
<!-- controllers -->
{foreach $js_bottom_files as $f}
<script src="{$f}"></script>
{/foreach}
<!-- services -->
<!-- directives -->
<style>
    {literal}
.bin {
  height: 450px;
  min-width: 250px;
  border: 1px solid red;
  padding: 20px;
}
.item {
  height:30px;
  border:solid 1px #333;
  margin:3px;
  background: #FFF;
}
.drag {
  opacity: 0.5;
}
.over {
  background: red;
}
    {/literal}
</style>
