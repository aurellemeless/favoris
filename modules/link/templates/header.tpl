
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{jrooturl ''}">Do Favorite</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="{jrooturl ''}">Home</a></li>
            <li><a href="{jurl 'link~default:about'}">About</a></li>
            {ifuserconnected}
            <li><a href="{jurl 'link~default:favorite'}">My Favoites</a></li>
            {/ifuserconnected}
                 
          </ul>
          <ul class="nav navbar-nav navbar-right">
              {ifuserconnected}
                    <li><a href="{jurl 'user~profile:index'}">{$user->lastname.' '.$user->firstname} <span class="sr-only">(current)</span></a></li>
              {else}
                <li><a href="{jurl 'jauth~login:form'}">Connexion <span class="sr-only">(current)</span></a></li>
                <li><a href="{jurl 'user~user:inscription'}"> Inscription <span class="sr-only">(current)</span></a></li>
              {/ifuserconnected}
               
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>