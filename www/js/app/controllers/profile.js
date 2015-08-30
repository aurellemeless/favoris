/* 
 *  Controller - profile 
 */
angular.module('shop')
        .controller('UserProfileController',['$scope','$http','shopdate',function($scope, $http, shopdate){
                //search form
                $scope.days = shopdate.days;
                $scope.monthes = shopdate.monthes;
                $scope.years = shopdate.years;
                $scope.user = {};
                $scope.operation = {};
                $scope.operation.show = true;
                $scope.saveUser = function(user){
                    if(user.$valid){

                        $http({
                            method  : 'POST',
                            url     : APPBASE+'index.php?module=user&action=profile:save',
                            data    : $.param($scope.user),  // pass in data as strings
                            headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                        })
                        .success(function(data) {
                              $scope.operation = data;
                              if(data.success){
                                  //$scope.formReset();
                              }

                        });


                    }
                };
                
                $scope.loadUser = function () {
                    $http({
                        method: 'POST',
                        url: APPBASE + 'index.php?module=user&action=user:current'
                    })
                            .success(function (data) {
                                $scope.user = data;
                            });
                };
                
                 $scope.isInvalid = function(field){
                        return $scope.form_user[field].$invalid && $scope.form_user[field].$dirty;
                  };

                  $scope.isValid = function(field){
                        return $scope.form_user[field].$valid && $scope.form_user[field].$dirty;
                  };
                  
                  
                $scope.loadUser();
                
        }]);




