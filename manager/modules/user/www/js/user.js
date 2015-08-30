/* 
 *  Role 
 */

angular.module('bos')
        .controller('UserUserController',['$scope','$http','$filter', 'blockUI',function($scope, $http, $filter,  blockUI){
                
                var saveurl=APPBASE+'index.php?module=user&action=user:save';
                $scope.list = true;
                //
                $scope.users = [];
                $scope.groups = [];
                $scope.usergroups = [];
                $scope.user = {};
                $scope.user.id = null;
                
                $scope.refresh = function(){
                   $scope.getList() ;
                    //$scope.categories = user.getData();
                };
                $http.get(APPBASE + 'index.php?module=user&action=group:read')
                       .success(function (data) {
                                $scope.groups = data.Items;
                       });
                $scope.getList = function () {
                     blockUI.start();
                    $http.get(APPBASE + 'index.php?module=user&action=user:read')
                       .success(function (data) {
                                $scope.users = data.Items;
                                 blockUI.stop();
                       });
                };
                $scope.getUserGroups = function(){
                    $http.get(APPBASE + 'index.php?module=user&action=usergroup:read&user_id='+$scope.user.id)
                       .success(function (data) {
                                $scope.usergroups = data.Items;
                       });
                };
                $scope.new = function(){
                    $scope.list = false;
                    $scope.user.id = null;
                    $scope.group_id = null;
                };
                
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.user = $scope.users[index];
                    $scope.list = false;
                    $scope.getUserGroups();
                    
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
                                  toastr.success(d.msg,OP_GOOD+' '+$scope.user.title);
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
               
               $scope.delete = function(id){
                        $http.get(APPBASE + 'index.php?module=user&action=user:delete&id='+id)
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
                        
                };
               
               $scope.remove = function(id){
                    if(confirm(DEL_CONFIRM)){
                       $scope.delete(id);
                       $scope.refresh();
                    }    
                };
               
                
                $scope.removeAll = function(){
                    if($scope.getSetected().length <1){
                        alert(NO_ROW);
                        return;
                    }
                    if(confirm(TRASH_CONFIRM)){
                        angular.forEach($scope.getSetected(), function(i) {
                            $scope.delete(i.id);
                        });
                        $scope.refresh();
                    }
                  
                };
                $scope.addGroup = function () {
                     blockUI.start();
                    $http.get(APPBASE + 'index.php?module=user&action=usergroup:save&group_id='+$scope.group_id+'&user_id='+$scope.user.id)
                       .success(function (data) {
                                //$scope.groups = data.Items;
                                blockUI.stop();
                                $scope.getUserGroups();
                       });
                };
                $scope.removeGroup = function (id) {
                     blockUI.start();
                    $http.get(APPBASE + 'index.php?module=user&action=usergroup:delete&group_id='+id+'&user_id='+$scope.user.id)
                       .success(function (d) {
                            //$scope.groups = data.Items;
                            blockUI.stop();
                            $scope.getUserGroups();
                            if(d.success){
                                   toastr.success(d.msg,OP_GOOD);
                                  
                            }else{
                                 toastr.error(d.msg,OP_BAD);
                            }
                       }).error(function (d){
                                toastr.error(E_500,OP_BAD);
                       });
                };
                
                $scope.getSetected = function () {
                      return $filter('filter')($scope.users, {checked: true});
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
                    document.form_user.reset();
                    $scope.user = {};
                    $scope.group_id = null;
                    $scope.form_user.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_user[field].$invalid && $scope.form_user[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_user[field].$valid && $scope.form_user[field].$dirty;
                };

               
                $scope.refresh();
               
        }]);




