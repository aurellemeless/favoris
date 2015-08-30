/* 
 *  Chat List
 */

angular.module('bos')
        .controller('ChatListController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
                
                $scope.tableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'asc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=chat&action=chat:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                                //$scope.chats = data.Items;
                       });
                       
                    }

                }); 
                
                $scope.refresh = function(){
                    $scope.tableParams.reload();
                    //$scope.forms = chat.getData();
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
                // services
                /**
                 * remove chat
                 * @returns {cats.data}
                 */
                $scope.delete = function (id) {
                    $http.get(APPBASE + 'index.php?module=chat&action=chat:delete&id='+id)
                            .success(function (d) {
                                    if(d.success){
                                        toastr.success(d.msg,OP_GOOD);
                                    }else{
                                        toastr.error(d.msg,OP_BAD);
                                    }

                            });
                };
                
                $scope.getSetected = function () {
                      return $filter('filter')($scope.$scope.tableParams.data, {checked: true});
                };
               
                $scope.refresh();
                
               
        }]);




