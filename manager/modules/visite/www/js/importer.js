/* 
 *  Controller Laboratoire - Save 
 */

angular.module('bos')
        .controller('ImporterController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=visite&action=importer:save';
                $scope.ico = APPBASE+'www/images/candidat.png';
                //
                $scope.importers = [];
                $scope.importer = {};
                $scope.importer.id = null;
                $scope.operation = {};
                $scope.operation.msg = '';
                $scope.operation.show = false;
                $scope.refresh = function(){
                   $scope.tableParams.reload() ;
                };
				
               
                $scope.save = function(importer,back){
                    if(importer.$valid){
                        var formElement = document.getElementById("form_importer");
                        var formData = new FormData(formElement);
                        //formData.append("candidats", $scope.importer.file);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.importer),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                    $scope.operation = d;
                                  toastr.success(d.msg,OP_GOOD);
                                  $scope.formReset();
                                  
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
               
                $scope.formReset = function(){
                    document.form_importer.reset();
                    $scope.importer = {};
                    $scope.form_importer.$setPristine();
                   
                };
                
        }]);




