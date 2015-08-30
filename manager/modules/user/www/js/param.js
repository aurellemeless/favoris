/* 
 *  Category 
 */

angular.module('bos')
        .controller('UserParamController',['$scope','$http','$filter', '$routeParams',function($scope, $http, $filter, $routeParams){
                
                var saveurl=APPBASE+'index.php?module=user&action=param:save';
                //
                $scope.params = [];
                $scope.param = {};
                $scope.app = $routeParams.app;
                $scope.id = null;
                $scope.refresh = function(){
                   $http.get(APPBASE+'index.php?module=user&action=param:read&app='+$scope.app)
                        .success(function(d) {
                              $scope.param = d.params; 
                              $scope.id = d.id; 
                        });
                };
                
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.param = $scope.params[index];
                };
               
                $scope.save = function(param,back){
                    if(param.$valid){
                        var formElement = document.getElementById("form_param");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.id);
                        formData.append("app", $scope.app);
                        formData.append("params", JSON.stringify($scope.param));
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.param),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });
                    }
                };
                
               
                $scope.refresh();
               
        }]);

