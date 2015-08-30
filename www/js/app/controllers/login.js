/* 
 *  Inscription 
 */
angular.module('auth',[]);
angular.module('auth')
     .controller('LoginController',['$scope','$http',function($scope, $http){
                
                 
                
        }])
        .controller('ConnexionController',['$scope','$http',function($scope, $http){
                
                 //validation
                
                 $scope.isInvalid = function(field){
                        return $scope.formLogin[field].$invalid && $scope.formLogin[field].$dirty;
                  };

                  $scope.isValid = function(field){
                        return $scope.formLogin[field].$valid && $scope.formLogin[field].$dirty;
                  };

                
        }])
    .controller('InscriptionController',['$scope','$http',function($scope, $http){
                
                //validation
                
                 $scope.isInvalid = function(field){
                        return $scope.form_user[field].$invalid && $scope.form_user[field].$dirty;
                  };

                  $scope.isValid = function(field){
                        return $scope.form_user[field].$valid && $scope.form_user[field].$dirty;
                  };
                
        }]);




