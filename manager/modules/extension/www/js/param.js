/* 
 *  Extensions param 
 */

angular.module('bos')
        .controller('ExtensionParamController',['$scope','$http','$filter', '$routeParams',function($scope, $http, $filter, $routeParams){
                
                var saveurl=APPBASE+'index.php?module=extension&action=param:save';
                //
                $scope.params = [];
                $scope.param = {};
                $scope.app = $routeParams.app;
                $scope.id = null;
                $scope.refresh = function(){
                   $http.get(APPBASE+'index.php?module=extension&action=param:read&app='+$scope.app)
                        .success(function(d) {
                              $scope.param = d.params; 
                              $scope.id = d.id; 
                        });
                };
                
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.param = $scope.params[index];
                };
               
                $scope.save = function(param){
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
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });
                    }
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_param[field].$invalid && $scope.form_param[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_param[field].$valid && $scope.form_param[field].$dirty;
                };
               
                $scope.refresh();
               
        }]);

