/* 
 *  Tag
 */

angular.module('bos')
        .controller('ChatAddController',['$scope','$http','$filter',function($scope, $http, $filter){
                
                var saveurl=APPBASE+'index.php?module=chat&action=chat:save';
                //
                $scope.users = [];
                
                $scope.message = {};
               
                $http.get(APPBASE + 'index.php?module=user&action=employee:read')
                       .success(function (data) {
                                $scope.users = data.Items;
                                
                       });
               
                
                $scope.save = function(form,back){
                    if(form.$valid){
                         
                        var formElement = document.getElementById("form_message");
                        var formData = new FormData(formElement);
                       
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.form),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                                  $scope.formReset();
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
                
                // services
                
                $scope.formReset = function(){
                    document.form_message.reset();
                    $scope.form = {};
                    $scope.message.receiver_id = null;
                    $scope.form_message.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(f){
                        return $scope.form_message[f].$invalid && $scope.form_tag[f].$dirty;
                 };

                 $scope.isValid = function(f){
                        return $scope.form_message[f].$valid && $scope.form_tag[f].$dirty;
                };

               
               
        }]);




