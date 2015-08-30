<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="content-type"/>
    <title>Installation Business Open Suite </title>
    <!-- Bootstrap core CSS -->
    <link href="/bos/www/styles/sb-admin/css/bootstrap.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="/bos/www/styles/sb-admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <style type="text/css">{literal}
        
ul.checkresults { border:3px solid black; margin: 2em; padding:1em; list-style-type:none; }
ul.checkresults li { margin:0; padding:5px; border-top:1px solid black; }
ul.checkresults li:first-child {border-top:0px}
li.error, p.error  { background-color:#ff6666;}
li.ok, p.ok      { background-color:#a4ffa9;}
li.warning { background-color:#ffbc8f;}
li.notice { background-color:#DBF0FF;}
.table tbody tr.notice td {
  background-color: #d9edf7;
}
.table tbody tr.error td {
  background-color: #f2dede;
}
/*
 * Base structure
 */

/* Move down content because we have a fixed navbar that is 50px tall */
body {
  margin: 0px;
  font-size:11pt;
}


/*
 * Global add-ons
 */

.sub-header {
  padding-bottom: 10px;
  border-bottom: 1px solid #eee;
}

/*
 * Top navigation
 * Hide default border to remove 1px line.
 */
.navbar-fixed-top {
  border: 0;
}

/*
 * Sidebar
 */

/* Hide for mobile, show later */
.sidebar {
  display: none;
}
@media (min-width: 768px) {
  .sidebar {
    position: fixed;
    top: 0px;
    bottom: 0;
    left: 0;
    z-index: 1000;
    display: block;
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
    background-color: #f5f5f5;
    border-right: 1px solid #eee;
  }
}

/* Sidebar navigation */
.nav-sidebar {
  margin-right: -21px; /* 20px padding + 1px border */
  margin-bottom: 20px;
  margin-left: -20px;
}
.nav-sidebar > li > a {
  padding-right: 20px;
  padding-left: 20px;
}
.nav-sidebar > .active > a,
.nav-sidebar > .active > a:hover,
.nav-sidebar > .active > a:focus {
  color: #fff;
  background-color: #428bca;
}


/*
 * Main content
 */

.main {
  padding: 20px;
}
@media (min-width: 768px) {
  .main {
    padding-right: 40px;
    padding-left: 40px;
  }
}
.main .page-header {
  margin-top: 0;
}


/*
 * Placeholder dashboard ideas
 */

.placeholders {
  margin-bottom: 30px;
  text-align: center;
}
.placeholders h4 {
  margin-bottom: 0;
}
.placeholder {
  margin-bottom: 20px;
}
.placeholder img {
  display: inline-block;
  border-radius: 50%;
}


    {/literal}</style>

</head>

<body >
    
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <h1> Etapes </h1>
          <ul class="nav nav-sidebar">
            <li {if $stepname=='welcome'}class="active"{/if}><a href="#">Welcome <span class="sr-only">(current)</span></a></li>
            <li {if $stepname=='checkjelix'}class="active"{/if}><a href="#">Prequesites</a></li>
            <li {if $stepname=='dbprofile'}class="active"{/if}><a href="#" >Database</a></li>
            <li {if $stepname=='end'}class="active"{/if}><a href="#">End</a></li>
          </ul>
          
        </div>
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            
            
            <div class="panel panel-primary">
            <div class="panel-heading">
              <h1 class="panel-title">{$appname} <span class="welcome">{@maintitle@}</span></h1>
            </div>
            <div class="panel-body">
                <div>
                    <form action="install.php" {if $enctype}enctype="{$enctype}"{/if} method="post">
                      <div>
                        <input type="hidden" name="step" value="{$stepname}" />
                        <input type="hidden" name="doprocess" value="1" />
                      </div>
                      <div id="page">
                        <div class="block">
                          <h2>{$title|eschtml}</h2>
                          <div class="blockcontent">
                          {if $messageHeader}<div id="contentheader">{@$messageHeader@|eschtml}</div>{/if}
                          {$MAIN}
                          {if $messageFooter}<div id="contentFooter">{@$messageFooter@|eschtml}</div>{/if}
                          </div>
                        </div>
                      </div>
                      <div>
                        {if $previous}
                          <button name="previous" class="btn btn-success btn-lg" onclick="location.href='install.php?step={$previous}';return false;">{@previousLabel@|eschtml}</button>
                        {/if}
                        {if $next}
                          <button  class="btn btn-success btn-lg" type="submit">{@nextLabel@|eschtml}</button>
                        {/if}
                      </div>
                    </form>
                </div>
            </div>
          </div>

            
        </div> 
          
      </div>
    </div>
    
    

</body>
</html>