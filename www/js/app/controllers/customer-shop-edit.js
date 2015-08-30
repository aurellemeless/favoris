/* 
 *  controllers - customer-shop
 */

angular.module('shop')
        .controller('CustomerShopEditController',['$scope','$http','$filter','$modal', '$log','ngTableParams',function($scope, $http, $filter, $modal, $log, ngTableParams){

               
            $scope.shop = {};
            $scope.shop.pro = 'YES';
            $scope.form = true;
                  
                $scope.formReset = function(){
                    //document.form_shop.reset();
                    $scope.shop = {};
                    $scope.form_shop.$setPristine();
                   
                };
               
                //validation
                 $scope.isInvalid = function(f){
                        return $scope.form_shop[f].$invalid && $scope.form_shop[f].$dirty;
                 };

                 $scope.isValid = function(f){
                        return $scope.form_shop[f].$valid && $scope.form_shop[f].$dirty;
                };
                //
                
                
                $scope.save = function(form){
                    if(form.$valid){
                         
                        var formElement = document.getElementById("form_shop");
                        var formData = new FormData(formElement);
                        formData.append("pro", $scope.shop.pro);
                        
                        $http({
                            method  : 'POST',
                            url     : APPBASE + 'index.php?module=customer&action=shop:update',
                            data    : formData,
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              if(d.success){
                                toastr.success(d.msg,OP_GOOD);
                                                                    
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
                
                $http.get('index.php?module=customer&action=shop:view')
                        .success(function(d) {
                              $scope.shop = d;

                        });
                
              

        }]);

