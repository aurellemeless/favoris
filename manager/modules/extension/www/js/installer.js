/* 
 *  Category 
 */

angular.module('bos')
        .controller('ExtensionInstallerController',['$scope','$http','$filter',function($scope, $http, $filter){
                
                //
                $scope.apps = [];
                $scope.app = {};
                $scope.refresh = function () {
                    $http.get( APPBASE + 'index.php?module=extension&action=installer:read')
                       .success(function (data) {
                           $scope.apps = data.Items;
                                
                       });
                };
                $scope.uninstall = function (index) {
                    $scope.app = $scope.apps[index];
                    $http.get( APPBASE + 'index.php?module=extension&action=installer:uninstall&app='+ $scope.app.info.attributes.name)
                       .success(function (d) {
                           if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                                  window.location.href=APPBASE+'#/extension-installer';
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }
                       });
                };
                $scope.install = function(app){
                    if(app.$valid){
                        var formElement = document.getElementById("form_app");
                        var formData = new FormData(formElement);
                        if(document.form_app.archive.value.length == 0){
                            toastr.warning(FILE_REQUIRED,OP_NOVALID);
                            return ;
                        }
                        
                        $http({
                            method  : 'POST',
                            url     : APPBASE+'index.php?module=extension&action=installer:install',
                            data    : formData,
                            //data    : $.param($scope.app),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                                  $scope.formReset();
                                  $scope.refresh();
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });
                    }
                };
               
                $scope.formReset = function(){
                    document.form_app.reset();
                    $scope.app = {};
                    $scope.form_app.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_app[field].$invalid && $scope.form_app[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_app[field].$valid && $scope.form_app[field].$dirty;
                };
                
                 $scope.refresh();
               
        }]);




