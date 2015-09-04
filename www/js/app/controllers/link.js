/* 
 *  Favorite Link
 */
angular.module('df')
        .controller('LinkController',['$scope','$http','ngTableParams',function($scope, $http, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=link&action=link:create';
                
                //subscribe form
                $scope.link = {};
                $scope.checker = {};
                $scope.checker.exist = false;
               
                $scope.saveLink = function(link){
                    if(link.$valid){
                        document.form_link.action=saveurl;
                        document.form_link.submit();
                    }
                };
                
                $scope.checkLink = function(field,q){
                    if($scope.form_link[field].$valid){
                         //communes
                        $http.get(APPBASE+'index.php?module=link&action=link:ckeckEmail&q='+q).
                              success(function(data, status) {
                                $scope.checker.exist= data.exist;
                              }).
                              error(function(data, status) {
                                console.log('ERROR checking email');
                            });
                    }
                };
                
                $scope.formReset = function(){
                    document.form_link.reset();
                    $scope.link = {};
                    $scope.form_link.$setPristine();
                };
                
                
                 
                /**
                 * remove link
                 * @returns {cats.data}
                 */
                $scope.delete = function (id) {
                    $http.get(APPBASE + 'index.php?module=link&action=link:delete&id='+id)
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
                        $http.get(APPBASE + 'index.php?module=link&action=link:trash&id='+id)
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
                
                //validation
                
                $scope.isInvalid = function(field){
                        return $scope.form_link[field].$invalid && $scope.form_link[field].$dirty;
                };

                $scope.isValid = function(field){
                        return $scope.form_link[field].$valid && $scope.form_link[field].$dirty;
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
                        $http.get(APPBASE + 'index.php?module=link&action=link:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.products = data.Items;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });
                       
                    }

                });

                
        }]);




