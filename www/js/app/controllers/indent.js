/* 
 *  controllers - indent
 */
angular.module('shop')
        .controller('IndentCtrl',['$scope','$http','$routeParams','$location',function($scope, $http, $routeParams,$location){
                        $scope.indents = [];
                        $http.get( APPBASE+'index.php?module=shop&action=indent:read')
                        .success(function(d,status) {
                                $scope.indents = d.Items ;
                                // $location.path('/indent');
                        }).
                           error(function(d, status) {
                                $scope.indents = [];
                                });
                                
                       $scope.detail = function(id){
                           window.location.href=APPBASE+'index.php?module=shop&action=indent:ticket&id='+id;
                       };
               
        }]);


