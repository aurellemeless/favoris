/* 
 *  Favorite Link
 */
angular.module('df')
        .controller('LinkController',['$scope','$http',function($scope, $http){
                
                var saveurl=APPBASE+'index.php?module=link&action=link:create';
                
                //subscribe form
                $scope.link = {};
                $scope.checker = {};
                $scope.checker.exist = false;
               
                $scope.saveLink = function(link){
                    if(link.$valid){
                        document.form_link.action=saveurl;
                        document.form_link.submit();
                    }
                };
                
                $scope.checkLink = function(field,q){
                    if($scope.form_link[field].$valid){
                         //communes
                        $http.get(APPBASE+'index.php?module=link&action=link:ckeckEmail&q='+q).
                              success(function(data, status) {
                                $scope.checker.exist= data.exist;
                              }).
                              error(function(data, status) {
                                console.log('ERROR checking email');
                            });
                    }
                };
                
                $scope.formReset = function(){
                    document.form_link.reset();
                    $scope.link = {};
                    $scope.form_link.$setPristine();
                };
                //validation
                
                $scope.isInvalid = function(field){
                        return $scope.form_link[field].$invalid && $scope.form_link[field].$dirty;
                };

                $scope.isValid = function(field){
                        return $scope.form_link[field].$valid && $scope.form_link[field].$dirty;
                };

                
        }]);




