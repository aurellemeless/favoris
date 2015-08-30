/*
 *init search file
 *
*/

var APPBASE = '/devis/';
var OP_GOOD = 'Opération réussie';
var OP_BAD = 'Opération Echouée';
var NO_ROW = 'Aucun élément sélectionné';
var DEL_CONFIRM = 'Voulez-vous vraiment supprimer cet élément ?';

angular.module('devis', [])
       .controller('SearchController',['$scope','$http','$filter', function($scope, $http, $filter){
                
                $scope.search = {};
                $scope.communes=[];
                $scope.events=[];
                $scope.shops=[];
                 //communes
//                $http.get(APPBASE+'index.php?module=event&action=event:read').
//                      success(function(data, status) {
//                        $scope.events = data.Items;
//                      }).
//                      error(function(data, status) {
//                        console.log('ERROR loading taxes');
//                    });
                
            
        }]).filter('shopDate', function myDateFormat($filter){
                        return function(text){
                            var  tempdate= new Date(text.replace(/-/g,"/"));
                            return $filter('date')(tempdate, "dd-MMMM-yyyy HH:mm:ss");
                        }
              });




