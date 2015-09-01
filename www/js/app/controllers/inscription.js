/* 
 *  Inscription 
 */
angular.module('dfInscription',['ui.bootstrap']);
angular.module('dfInscription')
        .controller('InscriptionController',['$scope','$http',function($scope, $http){
                
                var saveurl=APPBASE+'index.php?module=user&action=user:create';
                
                //subscribe form
                $scope.user = {};
                $scope.checker = {};
                $scope.checker.exist = false;
               
                $scope.saveUser = function(user){
                    if(user.$valid){
                        document.form_user.action=saveurl;
                        document.form_user.submit();
                    }
                };
                
                $scope.checkEmail = function(field,q){
                    if($scope.form_user[field].$valid){
                         //communes
                        $http.get(APPBASE+'index.php?module=user&action=user:ckeckEmail&q='+q).
                              success(function(data, status) {
                                $scope.checker.exist= data.exist;
                              }).
                              error(function(data, status) {
                                console.log('ERROR checking email');
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




