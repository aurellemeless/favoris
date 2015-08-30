/* 
 *  Chat view
 */

angular.module('bos')
        .controller('ChatViewController',['$scope','$http','$filter','$routeParams',function($scope, $http, $filter, $routeParams){
                
                $scope.message = {};
               
                $http.get(APPBASE + 'index.php?module=chat&action=chat:view&id='+$routeParams.id)
                       .success(function (data) {
                                $scope.message = data.item;
                                
                       });
               $http.get(APPBASE + 'index.php?module=chat&action=chat:opened&id='+$routeParams.id)
                       .success(function (data) {
                                //$scope.message = data.item;
                                
                       });
                               
        }]);




