{*zone 'header'*}
{*<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Welcome to Do Favorite</h1>
        <p>The best tool when you want to save your prefered links.</p>
        <p>
          <a class="btn btn-lg btn-primary" href="#" role="button">Sign in now &raquo;</a>
        </p>
      </div>

    </div> <!-- /container -->
    *}
{*include 'footer'*}
<!-- Meta -->
{meta_html description "HTML5 Template"}
{meta_html keywords "HTML5 Template"}
{meta_html keywords "Do Favorite"}

{meta_html title "doFavorite | Save your links"}
<!-- Mobile Metas -->
{meta_html others '<meta name="viewport" content="width=device-width, initial-scale=1.0">'}
<!-- Favicon -->
{meta_html others '<link rel="shortcut icon" href="'.$rootUrl.'www/styles/df/favicon.ico">'}
<!-- Google Webfont -->
{meta_html css 'http://fonts.googleapis.com/css?family=Vampiro+One'}
{meta_html css 'http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,700,800'}
{meta_html css 'http://fonts.googleapis.com/css?family=Josefin+Sans:400,100,100italic,300,300italic,600,700'}
    <!-- CSS -->

{meta_html css $rootUrl.'www/styles/df/css/font-awesome/css/font-awesome.css'}
{meta_html css $rootUrl.'www/styles/df/css/bootstrap.css'}
{meta_html css $rootUrl.'www/styles/df/js/slick/slick.css'}
{meta_html css $rootUrl.'www/styles/df/js/flex-slider/flexslider.css'}
{meta_html css $rootUrl.'www/styles/df/js/owl-carousel/owl.carousel.css'}
{meta_html css $rootUrl.'www/styles/df/js/owl-carousel/owl.theme.css'}
{meta_html css $rootUrl.'www/styles/df/js/owl-carousel/owl.transitions.css'}
{meta_html css $rootUrl.'www/styles/df/css/prettyphoto.css'}
{meta_html css $rootUrl.'www/styles/df/css/style.css'}
<!-- SKIN -->
{meta_html css $rootUrl.'www/styles/df/css/colors/skin-blue.css'}

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
{meta_html js 'https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js'}
{meta_html js 'https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js'}
    <!-- MODERNIZR -->
{meta_html js $rootUrl.'www/styles/df/js/modernizr.custom.js'}
{meta_html bodyattr array('id'=>'page-top')}

<div id="body">

    <!-- HEADER -->
    <header>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-top">
            <div class="container">
                <div class="col-md-12">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header page-scroll">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="./index.html">doFavorite</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="#">Help</a></li>
                            <li><a class="page-scroll" href="#footer">Contact</a></li>
                            <li><a href="http://themeforest.net/user/Dilipkumar/portfolio" target="_blank">Add link</a></li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
            </div>
        </nav>
    </header>

    <!-- INTRO -->
    <section id="intro">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-7">
                            <h2>Welcome to <strong><strong>doFavorite</strong></h2>
                            <p>The best tool when you want to save your prefered links. Never lose your favorites website references again.<br>
                                Your online bookmark !<br>
                            </p>
                            <div class="dual-btns">
                                <a href="#">Get started !</a>
                                <a href="#">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-5 sub-form">
                            <div id="sub-form">
                                <form class="subscribe" action="#" id="invite" method="POST">
                                    <input type="email" class="e-mail-login" placeholder="Email Address" name="email" id="address" data-validate="validate(required, email)">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="password" class="password-login" placeholder="Password" name="pwd" id="address" data-validate="validate(required, email)">
                                        </div>
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-success btn-center btn-lg col-md-12 e-mail-btn">Log in</button>
                                        </div>
                                    </div>




                                    <h5>New to doFavorite ? Sign up now</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="text" name="fname" id="fname" class="fname" placeholder="First Name">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" name="lname" id="lname" class="lname" placeholder="Last Name">
                                        </div>
                                    </div>
                                    <input type="email" class="e-mail" placeholder="Email Address" name="email" id="address" data-validate="validate(required, email)">
                                    <input type="password" class="password" placeholder="Password" name="pwd" id="address" data-validate="validate(required, email)">


                                    <input type="checkbox" name="checkboxG1" id="checkboxG1" class="css-checkbox" REQUIRED/>
                                    <label for="checkboxG1" class="css-label"><span>By clicking here, i agree to the <a class="term-popup" href="#">terms and conditions</a> of doFavorite</span></label>
                                    <div class="clearfix"></div>
                                    <div class="space40"></div>
                                    <button type="submit" class="btn-main btn-center">Sign up </button>
                                </form>
                            </div>
                            <span id="result"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- INTRO -->


    <!-- FEATURES -->
    <section id="features">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <!-- Download App Section -->
                    <div class="app-info">
                        <h3>In your browser</h3>
                        <p>Download doFavorite extension for your prefered browser and save your links more easyly</p>
                        <div class="app-btns">
                            <a href="#" class="fa fa-chrome" title="Download for Iphone"></a>
                            <a href="#" class="fa fa-firefox" title="Download for Android"></a>
                            <a href="#" class="fa fa-opera" title="Download for Windows"></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <img src="images/1.png" class="img-responsive" alt=""/>
                </div>
                <div class="col-md-4">
                    <div class="space60"></div>
                    <div class="feature-content">
                        <i class="fa fa-magic"></i>
                        <h4>Oganize your visited sites</h4>
                        <p>Morbi laoreet scelerisque orci finibus ullam corper quam sed aliquam semper utac aliquam magna quis</p>
                    </div>
                    <div class="feature-content">
                        <i class="fa fa-tablet"></i>
                        <h4>Backup your links</h4>
                        <p>Morbi laoreet scelerisque orci finibus ullam corper quam sed aliquam semper utac aliquam magna quis</p>
                    </div>
                    <div class="feature-content">
                        <i class="fa fa-toggle-on"></i>
                        <h4>Take screenshots</h4>
                        <p>Morbi laoreet scelerisque orci finibus ullam corper quam sed aliquam semper utac aliquam magna quis</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FEATURES -->

    <!-- FOOTER / COPYRIGHT -->
    <div class="footer-copy">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <p>&copy; 2015. doFavorite. All rights reserved.</p>
                </div>

                <div class="col-md-5">
                    <a class="backtotop page-scroll" href="#page-top">Back to top &Delta;</a>
                </div>
            </div>
        </div>
    </div>
    <!-- FOOTER / COPYRIGHT -->
</div>

<!-- TERMS / POPUP -->
<div class="overlay-dark"></div>
<div class="terms">
    <span class="t-close fa fa-close"></span>
    <h3>Terms and Conditions</h3>
    <ul>
        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed justo a erat blandit maximus. Mauris et odio eu nisl viverra pharetra vel quis ante. Sed finibus mauris nisl, vel semper diam rutrum id. Phasellus placerat augue ac fringilla lacinia. Cras feugiat feugiat nulla, eu dignissim ante faucibus in. Phasellus a quam nunc. Nulla ac vehicula ipsum. In molestie egestas magna vitae euismod. Donec aliquet pellentesque nulla, in blandit felis aliquet id. Nunc vel mauris eget est convallis aliquam. Aliquam arcu augue, tincidunt convallis metus non, blandit fringilla lacus.</li>
        <li>Sed varius et augue eu tristique. Duis pulvinar, lorem ac vestibulum accumsan, lorem augue elementum magna, vitae vehicula orci ante at augue. Nam placerat, nulla sit amet placerat lobortis, ante sem dapibus purus, quis efficitur ipsum ipsum eget leo. Cras elementum id neque eget euismod. Vestibulum tempus, eros vitae rutrum malesuada, metus dui viverra arcu, ac molestie nisl lacus ut tellus. Proin condimentum quam quis urna venenatis cursus. Donec sit amet felis in purus convallis imperdiet quis in mi. Sed gravida, purus nec porta dapibus, est elit egestas ante, sit amet dignissim eros mauris a tortor. Integer erat elit, porttitor et lobortis a, mollis eu turpis. Etiam porttitor augue nec erat luctus, eu varius orci malesuada. Phasellus blandit leo id pretium rutrum. Nunc ac vestibulum lacus. In viverra laoreet orci, vitae dictum turpis. Nunc metus neque, rhoncus eget rhoncus congue, cursus a turpis. Duis placerat turpis nunc, vitae elementum nibh pellentesque convallis. Maecenas pulvinar leo sed fringilla venenatis.</li>
        <li>Nulla tristique libero ut pellentesque mollis. Praesent condimentum viverra lacus, at consequat sapien ultricies quis. Suspendisse nec gravida nisl, et euismod arcu. Etiam eu condimentum risus, vel gravida lacus. In vitae est a nisl scelerisque molestie id a libero. Ut eget nisi at dolor maximus hendrerit. Nam non mattis ex, quis mattis velit.</li>
    </ul>
</div>

<!-- Javascript -->
<script src="{$rootUrl}www/styles/df/js/jquery.js"></script>
<script src="{$rootUrl}www/styles/df/js/bootstrap.min.js"></script>
<script src="{$rootUrl}www/styles/df/js/jquery.easing.min.js"></script>
<script src="{$rootUrl}www/styles/df/js/flex-slider/jquery.flexslider.js"></script>
<script src="{$rootUrl}www/styles/df/js/owl-carousel/owl.carousel.js"></script>
<script src="{$rootUrl}www/styles/df/js/slick/slick.js"></script>
<script src="{$rootUrl}www/styles/df/js/jquery.prettyphoto.js"></script>
<script src="{$rootUrl}www/styles/df/js/contact.js"></script>
<script src="{$rootUrl}www/styles/df/js/mc/jquery.ketchup.all.min.js"></script>
<script src="{$rootUrl}www/styles/df/js/mc/main.js"></script>
<script src="{$rootUrl}www/styles/df/js/jquery.countdown.min.js"></script>
<script src="{$rootUrl}www/styles/df/js/main.js"></script>
