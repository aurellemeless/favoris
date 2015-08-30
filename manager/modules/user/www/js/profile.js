/* 
 *  User Profile
 */

angular.module('bos')
        .controller('UserProfileController',['$scope','$http','$filter', 'blockUI',function($scope, $http, $filter,  blockUI){
                
                var saveurl=APPBASE+'index.php?module=user&action=user:save';
                $scope.ico = APPBASE+'www/images/candidat.png';
                $scope.list = true;
                //
                $scope.user = {};
                $scope.user.id = null;
                
                $http.get(APPBASE + 'index.php?module=user&action=profile:current')
                       .success(function (data) {
                                $scope.user = data;
                       });
                
                $scope.edit = function(index){
                    $scope.list = false;
                };
               
                $scope.save = function(user,back){
                    if(user.$valid){
                        var formElement = document.getElementById("form_user");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.user.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.user),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                                  if(back)
                                      $scope.list = true;
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
               
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_user[field].$invalid && $scope.form_user[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_user[field].$valid && $scope.form_user[field].$dirty;
                };

               
        }]);




