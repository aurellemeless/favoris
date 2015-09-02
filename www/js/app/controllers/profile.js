/* 
 *  Controller - profile 
 */
angular.module('auth',[])
angular.module('auth')
        .controller('UserProfileController',['$scope','$http',function($scope, $http, linkdate){
                //search form
                
                $scope.user = {};
                $scope.operation = {};
                $scope.operation.success = null;
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




