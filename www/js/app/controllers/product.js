/* 
 *  controllers - product
 */
angular.module('shop')
        .controller('ProductCtrl',['$scope','$http','$routeParams',function($scope, $http, $routeParams){
           var prodUrl = APPBASE+'index.php?module=parametre&action=product:view&id='+$routeParams.productId;
           $scope.prodQty = 1;
            //communes
           $http.get(prodUrl).
                  success(function(data, status) {
                    $scope.product = data;
                    $scope.product.image = APPBASE+'images/icons/products/'+$scope.product.image;
                    //$scope.data = data;
                  }).
                  error(function(data, status) {
                    $scope.data = data || "Request failed";
                    $scope.status = status;
                });
           
            $scope.basket.addProduct = function(id){
                        $http.get(APPBASE+'index.php?module=shop&action=basket:add&id='+id+'&qty='+$scope.prodQty).
                       success(function(data, status) {
                          if(data.success){
                              $scope.basket.read();
                              $scope.basket.setTotal();
                              toastr.success(data.msg,OP_GOOD);
                          }else{
                             toastr.error(data.msg,OP_BAD);
                          }
                       }).
                       error(function(data, status) {

                   });
               };    
                        
        }]);


