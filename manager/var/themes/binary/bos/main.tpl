{*meta_html css 'http://fonts.googleapis.com/css?family=Dosis:400,300,200,500,600,700,800'*}
{meta_html css $rootUrl.'www/styles/binary-admin/assets/css/bootstrap.css'}
{meta_html css $rootUrl.'www/styles/binary-admin/font-awesome/css/font-awesome.min.css'}
{meta_html css $rootUrl.'www/styles/binary-admin/assets/css/custom.css'}

{foreach $js_head_files as $f}
    {meta_html js $f}
{/foreach}
{meta_html bodyattr array('ng-app'=>'bos')}

 <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Visite Medicale</a>
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> {$user->lastname} {$user->firstname} <a href="#/user-profile" class="btn btn-default square-btn-adjust">Profil</a> <a href="{jurl 'jauth~login:out'}" class="btn btn-danger square-btn-adjust">Deconnexion</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="{$rootUrl}www/images/system.png" class="user-image img-responsive"/>
                    </li>
                    {foreach $menus as $mod}
                       {$mod}
                    {/foreach}     
                    
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12" ng-view>
                     
                    </div>
                </div>              
                
                 <!-- /. ROW  -->
                <hr />                
                
                 <!-- /. ROW  -->           
            </div>
             <!-- /. PAGE INNER  -->
        </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
   
    <!-- METISMENU SCRIPTS -->
    <script src="{$rootUrl}www/styles/binary-admin/assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="{$rootUrl}www/styles/binary-admin/assets/js/custom.js"></script>






    <!-- Bootstrap Core JavaScript     -->  
<script src="{jurl 'bos~default:extensionsConfig'}"></script>
<!-- controllers -->
{foreach $js_bottom_files as $f}
<script src="{$f}"></script>
{/foreach}
<!-- services -->
<!-- directives -->
