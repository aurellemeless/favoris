/* 
 *  controllers - customer-shop
 */

$(function(){
    //Click event to scroll to top
	$('.remonte').click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});
});

angular.module('shop')
        .controller('CustomerShopController',['$scope','$http','$filter','$modal', '$log','ngTableParams',function($scope, $http, $filter, $modal, $log, ngTableParams){

               
            $scope.shop = {};
            $scope.shop.pro = 'YES';
            $scope.form = true;
                           
                $scope.refresh = function(){
                  $scope.tableParams.reload() ;
                    //$scope.shops = shop.getData();
                };
                    
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
                
              

        }]);

