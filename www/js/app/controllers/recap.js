/* 
 *  Recapitulatif
 */
angular.module('shop')
        .controller('RecapController',['$scope','$http','shopdate',function($scope, $http, shopdate){
                $scope.method = {};
                $scope.payments = [];
                $scope.method.payment = null;
                $scope.voucher = {};
                $scope.verifyVoucher = false;
                $scope.voucher.code = null;
                $http.get(APPBASE+'index.php?module=payment&action=payment:read')
                            .success(function(d,status) {
                                   $scope.payments = d.Items;
                            }).
                               error(function(d, status) {
                                   
                                    });
                $scope.checkout = function(){
                        
                        $http.get(APPBASE+'index.php?module=order&action=order:save&payment_id='+$scope.method.payment)
                            .success(function(d,status) {
                                    if(d.success){
                                      //window.open();
                                        window.location.href = APPBASE+'index.php?module=order&action=order:ticket&id='+d.id;
                                    }else{
                                        alert(d.msg);
                                    }

                            }).
                               error(function(d, status) {
                                   
                                    });
                };
                
                $scope.back = function(){
                    window.location.href = APPBASE+'index.php?module=order&action=delivery:index';
                };
                
                $scope.toggleVoucher = function(){
                           $scope.addVoucher=!$scope.addVoucher;
                       };
               
                $scope.checkVoucher = function(){
                        
                        $http.get(APPBASE+'index.php?module=promo&action=voucher:check&voucher='+$scope.voucher.code)
                            .success(function(d,status) {
                                    if(d.verify){
                                        //console.log(d.voucher);
                                        $scope.verifyVoucher = d.verify;
                                        $scope.voucher = d.voucher;
                                    }else{
                                        alert(d.msg);
                                    }

                            }).
                               error(function(d, status) {
                                   
                                    });
                };
                 $http.get(APPBASE+'index.php?module=promo&action=voucher:read')
                            .success(function(d,status) {
                                    if(d.verify){
                                        $scope.verifyVoucher = d.verify;
                                        $scope.voucher = d.voucher;
                                    }

                            }).
                               error(function(d, status) {
                                   console.log('SERVER INTERNAL ERROR : INVALID VOUCHER');
                                    });
                       
        }]);


