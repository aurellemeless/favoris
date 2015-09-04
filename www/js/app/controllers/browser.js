/* 
 *  BRowser 
 */

angular.module('df')
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




