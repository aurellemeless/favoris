/* 
 *  Inscription 
 */
//angular.module('shopApp',['ngRoute','ngTouch','ui.bootstrap','ui.utils']);
angular.module('shop')
        .controller('InscriptionCtrl',['$scope','$http',function($scope, $http){
                
                var saveurl='/shop/index.php?module=user&action=user:create';
                
                //search form
                $scope.user = {};
                $scope.inscription = {};
                $scope.inscription.show = true;
               
                $scope.saveUser = function(user){
                    if(user.$valid){

                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : $.param($scope.user),  // pass in data as strings
                            headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                        })
                        .success(function(data) {
                              $scope.inscription = data;
                              if(data.success){
                                  $scope.formReset();
                              }

                        });


                    }
                };
                
                
                $scope.formReset = function(){
                    document.form_user.reset();
                    $scope.user = {};
                    $scope.form_user.$setPristine();
                   
                };
                //validation
                
                 $scope.isInvalid = function(field){
                        return $scope.form_user[field].$invalid && $scope.form_user[field].$dirty;
                  };

                  $scope.isValid = function(field){
                        return $scope.form_user[field].$valid && $scope.form_user[field].$dirty;
                  };

                
        }]);




