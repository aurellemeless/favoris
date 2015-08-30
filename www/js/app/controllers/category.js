/* 
 *  controllers - product
 */
angular.module('shop')
        .controller('CategoryCtrl',['$scope','$http','$routeParams',function($scope, $http, $routeParams){
           var prodUrl = APPBASE+'index.php?module=parametre&action=product:category&id='+$routeParams.categoryId;
            //communes
           /*$http.get(prodUrl).
                  success(function(data, status) {
                    $scope.product = data;
                    $scope.product.image = APPBASE+'images/icons/products/'+$scope.product.image;
                    //$scope.data = data;
                  }).
                  error(function(data, status) {
                    $scope.data = data || "Request failed";
                    $scope.status = status;
                });*/
               
                        
        }]);


