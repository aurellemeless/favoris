/* 
 *  Category 
 */

angular.module('bos')
        .controller('UserGroupController',['$scope','$http','$filter',function($scope, $http, $filter){
                
                var saveurl=APPBASE+'index.php?module=user&action=group:save';
                $scope.list = true;
                //
                $scope.groups = [];
                $scope.group = {};
                $scope.group.id = null;
                $scope.operation = {};
                $scope.operation.show = false;
                $scope.refresh = function(){
                   $scope.getList() ;
                    //$scope.categories = group.getData();
                };
                
                $scope.getList = function () {
                    $http({
                        method: 'POST',
                        url: APPBASE + 'index.php?module=user&action=group:read'
                    })
                       .success(function (data) {
                                $scope.groups = data.Items;
                       });
                };
                
                $scope.new = function(){
                    $scope.list = false;
                    $scope.group.id = null;
                };
                
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.group = $scope.groups[index];
                    $scope.list = false;
                };
               
                $scope.save = function(group,back){
                    if(group.$valid){
                        var formElement = document.getElementById("form_group");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.group.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.group),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD+' '+$scope.group.title);
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
                /*
                $scope.remove = function(id){
                    if(confirm(DEL_CONFIRM)){
                        droitGroup.delete(id);
                        $scope.refresh();
                    }    
                    
                };
                $scope.trashAll = function(){
                    if($scope.getSetected().length <1){
                        alert(NO_ROW);
                        return;
                    }
                    if(confirm(TRASH_CONFIRM)){
                        angular.forEach($scope.getSetected(), function(i) {
                            droitGroup.trash(i.id);
                        });
                        $scope.refresh();
                    }
                  
                };
                
                $scope.getSetected = function () {
                      return $filter('filter')($scope.categories, {checked: true});
                };
                */
                /*$scope.trash = function(id){
                    
                    if(confirm(TRASH_CONFIRM)){
                        droitGroup.trash(id);
                        $scope.refresh();
                    }
                    
                };
                */
                $scope.formReset = function(){
                    document.form_group.reset();
                    $scope.group = {};
                    $scope.form_group.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_group[field].$invalid && $scope.form_group[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_group[field].$valid && $scope.form_group[field].$dirty;
                };

               
                $scope.refresh();
               
        }]);




