  {ifright 'visite.laboratoire'}
        <li>
           <a href="javascript:;" data-toggle="collapse" data-target="#laboratoire">
             <i class="fa fa-fw fa-glass"></i> LABORATOIRE <span class="fa arrow"></span>
           </a>
           <ul id="laboratoire" class="nav nav-second-level">
               <li>
                   <a href="#/laboratoire-save">Enregistrement</a>
               </li>
              <li>
                   <a href="#/laboratoire-result">Resultats</a>
              </li>
           </ul>
       </li>
  {/ifright}
  {ifright 'visite.radiologie'}
       <li>
           <a href="javascript:;" data-toggle="collapse" data-target="#radiologie">
             <i class="fa fa-fw fa-random"></i> RADIOLOGIE <span class="fa arrow"></span>
           </a>
           <ul id="radiologie" class="nav nav-second-level">
               <li>
                   <a href="#/radiologie-save">Enregistrement</a>
               </li>
              <li>
                   <a href="#/radiologie-result">Resultats</a>
               </li>
           </ul>
       </li>
  {/ifright}
  {ifright 'visite.candidat'}
       <li>
           <a href="#/candidat">
             <i class="fa fa-fw fa-users"></i> CANDIDATS 
           </a>
       </li>
  {/ifright}
  {ifright 'visite.importer'}
       <li>
           <a href="#/importer">
             <i class="fa fa-fw fa-download"></i> IMPORTATION 
           </a>
       </li>
  {/ifright}