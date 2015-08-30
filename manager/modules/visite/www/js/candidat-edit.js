/* 
 *  Controller Candidat - Edit 
 */

angular.module('bos')
        .controller('CandidatEditController',['$scope','$http','$routeParams',function($scope, $http, $routeParams){
                
                var saveurl=APPBASE+'index.php?module=visite&action=candidat:save';
                $scope.ico = APPBASE+'www/images/candidat.png';
                //
                $scope.candidats = [];
                $scope.candidat = {};
                $scope.candidat.id = $routeParams.id;
                $scope.operation = {};
                $scope.operation.show = false;
               
                $http.get(APPBASE+'index.php?module=visite&action=candidat:view&id='+$routeParams.id)
                .success(function(d) {
                      $scope.candidat = d.row;
                });
                $scope.save = function(candidat,back){
                    if(candidat.$valid){
                        var formElement = document.getElementById("form_candidat");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.candidat.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.candidat),  // pass in data as strings
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
               
                $scope.formReset = function(){
                    document.form_candidat.reset();
                    $scope.candidat = {};
                    $scope.form_candidat.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_candidat[field].$invalid && $scope.form_candidat[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_candidat[field].$valid && $scope.form_candidat[field].$dirty;
                };

               
        }]);




