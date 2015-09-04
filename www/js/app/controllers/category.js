/* 
 *  Category 
 */

angular.module('df')
        .controller('CategoryController',['$scope','$http','$filter', '$q', 'ngTableParams',function($scope, $http, $filter, $q, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=link&action=category:save';
                $scope.list = true;
                //
                $scope.category = {};
                $scope.category.id = null;
                
                $scope.new = function(){
                    $scope.list = false;
                    $scope.category.id = null;
                };
                
                $scope.edit = function(index){
                    $scope.category = $scope.tableParams.data[index];
                    $scope.list = false;
                };
               
                $scope.save = function(category,back){
                    if(category.$valid){
                        var formElement = document.getElementById("form_category");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.category.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.category),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD+' '+$scope.category.title);
                                  $scope.formReset();
                                  $scope.tableParams.reload();
                                  if(back)
                                      $scope.list = true;
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
                
                 
                /**
                 * remove category
                 * @returns {cats.data}
                 */
                $scope.delete = function (id) {
                    $http.get(APPBASE + 'index.php?module=link&action=category:delete&id='+id)
                            .success(function (d) {
                                    if(d.success){
                                        toastr.success(d.msg,OP_GOOD);
                                    }else{
                                        toastr.error(d.msg,OP_BAD);
                                    }

                            });
                };
                $scope.remove = function(id){
                    if(confirm(DEL_CONFIRM)){
                        $scope.delete(id);
                        $scope.tableParams.reload();
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
                        $scope.tableParams.reload();
                    }
                  
                };
                
                $scope.getSetected = function () {
                      return $filter('filter')($scope.tableParams.data, {checked: true});
                };
                
                $scope.trash = function(id){
                    
                    if(confirm(TRASH_CONFIRM)){
                        $http.get(APPBASE + 'index.php?module=link&action=category:trash&id='+id)
                            .success(function (d) {
                                    if(d.success){
                                        toastr.success(d.msg,OP_GOOD);
                                    }else{
                                        toastr.error(d.msg,OP_BAD);
                                    }

                            });
                        $scope.tableParams.reload();
                    }
                    
                };
                
                $scope.formReset = function(){
                    document.form_category.reset();
                    $scope.category = {};
                    $scope.form_category.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_category[field].$invalid && $scope.form_category[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_category[field].$valid && $scope.form_category[field].$dirty;
                };

               $scope.tableParams = new ngTableParams({
                    
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'asc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        //console.log(start);
                        $http.get(APPBASE + 'index.php?module=link&action=category:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.products = data.Items;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });
                       
                    }

                });
               
        }]);




