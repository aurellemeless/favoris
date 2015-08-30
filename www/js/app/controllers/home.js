/* 
 *
 */

angular.module('houseApp',['ngRoute','ngTouch','ui.bootstrap','ui.utils']);

var caturl='http://localhost/topresi/index.php?module=parametre&action=category:read';;
var comurl='http://localhost/topresi/index.php?module=parametre&action=commune:read';
var lastestUrl='http://localhost/topresi/index.php?module=house&action=search:result&take=6';

angular.module('houseApp')
        .controller('HomeCtrl',['$scope','$http','$routeParams',function($scope, $http, $routeParams){
              
            $scope.search = {};
                      
            $scope.search.filterCollapsed = false;
            $scope.toogleFilter = function(){
                $scope.search.filterCollapsed = !$scope.search.filterCollapsed;
            };
            
                
                $scope.showSearch=false;
                $scope.categories=[];
                $scope.communes=[];
                $scope.maisons=[];
                //search form
                $scope.search.category=0;
                $scope.search.commune=0;
                //cat
                $http({method: 'GET', url: caturl}).
                      success(function(data, status) {
                        $scope.categories = data.Items;
                        //$scope.data = data;
                      }).
                      error(function(data, status) {
                        $scope.data = data || "Request failed";
                        $scope.status = status;
                    });
                //communes
               $http({method: 'GET', url: comurl}).
                      success(function(data, status) {
                        $scope.communes = data.Items;
                        //$scope.data = data;
                      }).
                      error(function(data, status) {
                        $scope.data = data || "Request failed";
                        $scope.status = status;
                    });
               //latest houses
               $http({method: 'GET', url: lastestUrl}).
                      success(function(data, status) {
                        $scope.maisons = data.rows;
                        //$scope.data = data;
                      }).
                      error(function(data, status) {
                        $scope.data = data || "Request failed";
                        $scope.status = status;
                    });

              
                        
        }]);


