/* 
 *  BRowser 
 */
angular.module('dfBrowser',['ngRoute','ui.bootstrap','ngTable']);
angular.module('dfBrowser')
        .config(['$routeProvider', '$locationProvider',
          function($routeProvider,$locationProvider) {
              $routeProvider.when('/browser/:id', {
                                    templateUrl:APPBASE+'index.php?module=link&action=default:browser',
                                    controller: 'BrowserController'
                              }).
                otherwise({
                  redirectTo: '/',
                  templateUrl: APPBASE+'index.php?module=link&action=default:browser',
                  controller: 'BrowserController'
                });
                
              // $locationProvider.html5Mode(true);
          }])
        .controller('BrowserController',['$scope','$http','$filter', '$q', 'ngTableParams','$routeParams','$sce',function($scope, $http, $filter, $q, ngTableParams,$routeParams, $sce){
                //
               $scope.link = {};
               $scope.link.url = '';
               $http.get(APPBASE + 'index.php?module=link&action=link:view&id='+$routeParams.id)
                            .success(function (d) {
                                    $scope.link = d.row;
                                    $scope.link.url = this.frameUrl= $sce.trustAsResourceUrl($scope.link.url);
                            });
                        
                
                
               
        }]);




