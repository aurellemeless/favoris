{literal}
/*
 * init file
 *
*/
var APPBASE =  {/literal}'{$rootUrl}';{literal}
var LIST_SIZE = 10;
var PAGINATION_SIZE = 5;
var OP_GOOD = 'Opération réussie';
var OP_BAD = 'Opération Echouée';
var OP_NOVALID = 'Données Invalides';
var E_500 = '500 erreur interne ';
var NO_ROW = 'Aucun élément sélectionné';
var FILE_REQUIRED = 'Vueillez selectionner un fichier';
var TRASH_CONFIRM = 'Voulez-vous vraiment supprimer cet élément ? ';
var DEL_CONFIRM = 'Voulez-vous vraiment supprimer ces éléments ? ';
var SOLD_CONFIRM = 'Voulez-vous vraiment marquer ces éléments comme soldés ?';
var DEL_ONE_CONFIRM = 'Voulez-vous vraiment supprimer cet élément ? ';
var FEATURE_CONFIRM = 'Voulez-vous vraiment mettre cet élémént en avant ?';
var UNFEATURE_CONFIRM = 'Voulez-vous vraiment retire cet élémént en avant ?';

angular.module('bos', ['ngRoute','ngTouch','blockUI','ngTable','ngCkeditor','ngResource','ui.bootstrap','ui.utils','ui.tinymce','ngDraggable','ngSanitize', 'ui.select','colorpicker.module','textAngular','angularFileUpload'
 {/literal}{foreach $config['modules'] as $m}
                   ,{$m}    
{/foreach} {literal}
])
        .config(['$routeProvider', '$locationProvider',
          function($routeProvider,$locationProvider) {
              $routeProvider.
                {/literal}
                        {foreach $config['config'] as $c}
                            
                             when('{$c->route}', {literal}{
                                {/literal}templateUrl: 
                                    {if $c->fonction=="true"} 
                                        {$c->fonctionContent}
                                    {else} 
                                        APPBASE+'{$c->templateUrl}'
                                    {/if},
                                controller: '{$c->controller}'
                              }){literal}.
                             {/literal}
                        {/foreach}
                {literal} 
                otherwise({
                  redirectTo: '/',
                  templateUrl: APPBASE+'index.php?module=bos&action=default:dashboard'
                });
                
              // $locationProvider.html5Mode(true);
          }])
      .controller('MainController',['$scope','$http','$routeParams','$location',function($scope, $http, $routeParams,$location){
            
        }]);
{/literal}  
