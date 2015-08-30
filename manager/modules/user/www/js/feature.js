/* 
 *  Category 
 */

angular.module('bos')
        .controller('UserFeatureController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=user&action=feature:save';
                $scope.list = true;
                //
                $scope.features = [];
                $scope.feature = {};
                $scope.feature.id = null;
                $scope.operation = {};
                $scope.operation.show = false;
                $scope.refresh = function(){
                   $scope.tableParams.reload() ;
                };
				
                $scope.tableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'desc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=user&action=feature:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });

                    }

                });
                
                $scope.new = function(){
                    $scope.list = false;
                    $scope.feature.id = null;
                };
                
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.feature = $scope.tableParams.data[index];
                    $scope.list = false;
                };
               
                $scope.save = function(feature,back){
                    if(feature.$valid){
                        var formElement = document.getElementById("form_feature");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.feature.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.feature),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD+' '+$scope.feature.title);
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
                    document.form_feature.reset();
                    $scope.feature = {};
                    $scope.form_feature.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_feature[field].$invalid && $scope.form_feature[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_feature[field].$valid && $scope.form_feature[field].$dirty;
                };

               
        }]);




