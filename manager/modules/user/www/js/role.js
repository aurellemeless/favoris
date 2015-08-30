/* 
 *  Role 
 */

angular.module('bos')
        .controller('UserRoleController',['$scope','$http','$filter', 'blockUI',function($scope, $http, $filter,  blockUI){
                
                var saveurl=APPBASE+'index.php?module=user&action=role:save';
                $scope.list = true;
                //
                $scope.roles = [];
                $scope.features = [];
                $scope.rolefeatures = [];
                $scope.role = {};
                $scope.role.id = null;
                $scope.refresh = function(){
                   $scope.getList() ;
                    //$scope.categories = role.getData();
                };
                $http.get(APPBASE + 'index.php?module=user&action=feature:read')
                       .success(function (data) {
                                $scope.features = data.Items;
                       });
                $scope.getList = function () {
                     blockUI.start();
                    $http.get(APPBASE + 'index.php?module=user&action=role:read')
                       .success(function (data) {
                                $scope.roles = data.Items;
                                 blockUI.stop();
                       });
                };
                
                $scope.new = function(){
                    $scope.list = false;
                    $scope.role.id = null;
                };
                
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.role = $scope.roles[index];
                    $scope.list = false;
                };
               
                $scope.save = function(role,back){
                    if(role.$valid){
                        var formElement = document.getElementById("form_role");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.role.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.role),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD+' '+$scope.role.title);
                                  $scope.formReset();
                                  $scope.refresh();
                                  if(back)
                                      $scope.list = true;
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
               
               $scope.remove = function(id){
                    if(confirm(DEL_CONFIRM)){
                        $http.get(APPBASE + 'index.php?module=user&action=role:delete&id='+id)
                       .success(function (d) {
                                if(d.success){
                                    toastr.success(d.msg,OP_GOOD);
                                }else{
                                    toastr.error(d.msg,OP_BAD);
                                }
                       })
                       .error(function (d) {
                                toastr.error(E_500,OP_BAD);
                       });
                        
                    }    
                };
               
                
                $scope.removeAll = function(){
                    if($scope.getSetected().length <1){
                        alert(NO_ROW);
                        return;
                    }
                    if(confirm(TRASH_CONFIRM)){
                        angular.forEach($scope.getSetected(), function(i) {
                            $scope.remove(i.id);
                        });
                        $scope.refresh();
                    }
                  
                };
                
                $scope.getSetected = function () {
                      return $filter('filter')($scope.roles, {checked: true});
                };
                /**/
                /*$scope.trash = function(id){
                    
                    if(confirm(TRASH_CONFIRM)){
                        droitGroup.trash(id);
                        $scope.refresh();
                    }
                    
                };
                */
                $scope.formReset = function(){
                    document.form_role.reset();
                    $scope.role = {};
                    $scope.form_role.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_role[field].$invalid && $scope.form_role[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_role[field].$valid && $scope.form_role[field].$dirty;
                };

               
                $scope.refresh();
               
        }]);




