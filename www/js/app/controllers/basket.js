/* 
 *  controllers - basket
 */
angular.module('shop')
        .controller('BasketController',['$scope','$http',function($scope, $http){
                       $scope.basket.read();
                       $scope.basket.setTotal();
                       $scope.next = function(){
                    
                            var data ={basket : $scope.basket.products};
                           $http({
                                   method  : 'POST',
                                   url     : APPBASE+'index.php?module=order&action=basket:save',
                                   data    : $.param(data),  // pass in data as strings
                                   headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                                  // headers : { 'Content-Type': undefined },
                                   //transformRequest: data
                               })
                               .success(function(d,status) {
                                     if(d.success){
                                            //$location.path('/delivery');
                                            window.location.href=APPBASE+'index.php?module=order&action=delivery:index';
                                          }else{
                                              alert(d.msg);
                                          }

                               }).
                                  error(function(d, status) {

                                       });

                       };
                       
                       
                       
               
        }]);


