/* 
 *  Employee
 */

angular.module('bos')
        .controller('UserEmployeeController',['$scope','$http','$filter', 'blockUI','ngTableParams',function($scope, $http, $filter,  blockUI, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=user&action=employee:save';
                $scope.list = true;
                //
                $scope.employees = [];
                $scope.groups = [];
                $scope.usergroups = [];
                $scope.employee = {};
                $scope.employee.id = null;
                
                $scope.refresh = function(){
                    $scope.tableParams.reload();
                    //$scope.categories = user.getData();
                };
                $http.get(APPBASE + 'index.php?module=user&action=group:read')
                       .success(function (data) {
                                $scope.groups = data.Items;
                       });
                
                $scope.tableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'asc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=user&action=employee:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                                //$scope.tags = data.Items;
                       });
                       
                    }

                }); 
                
               
                $scope.getUserGroups = function(){
                    $http.get(APPBASE + 'index.php?module=user&action=usergroup:read&user_id='+$scope.employee.user_id)
                       .success(function (data) {
                                $scope.usergroups = [];
                                $scope.usergroups = data.Items;
                       });
                };
                $scope.new = function(){
                    $scope.list = false;
                    $scope.employee.id = null;
                    $scope.group_id = null;
                };
                
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.employee = $scope.tableParams.data[index];
                    $scope.list = false;
                    $scope.getUserGroups();
                    $scope.employee.cpassword = $scope.employee.password;
                    
                };
               
                $scope.save = function(user,back){
                    if(user.$valid){
                        var formElement = document.getElementById("form_employee");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.employee.user_id);
                        
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
                                  toastr.success(d.msg,OP_GOOD+' '+$scope.employee.email);
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
                        $http.get(APPBASE + 'index.php?module=user&action=employee:delete&id='+id)
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
                    $http.get(APPBASE + 'index.php?module=user&action=usergroup:save&group_id='+$scope.group_id+'&user_id='+$scope.employee.user_id)
                       .success(function (data) {
                                //$scope.groups = data.Items;
                                blockUI.stop();
                                $scope.getUserGroups();
                       });
                };
                $scope.removeGroup = function (id) {
                     blockUI.start();
                    $http.get(APPBASE + 'index.php?module=user&action=usergroup:delete&group_id='+id+'&user_id='+$scope.employee.user_id)
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
                      return $filter('filter')($scope.tableParams.data, {checked: true});
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
                    document.form_employee.reset();
                    $scope.employee = {};
                    $scope.group_id = null;
                    $scope.form_employee.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_employee[field].$invalid && $scope.form_employee[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_employee[field].$valid && $scope.form_employee[field].$dirty;
                };

               
               
        }]);




