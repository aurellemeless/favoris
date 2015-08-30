/* 
 *  controllers - credit
 */
angular.module('shop')
        .controller('CreditController',['$scope','$http','$filter','$modal', '$log','ngTableParams',function($scope, $http, $filter, $modal, $log, ngTableParams){

                $scope.list = true;
                //
                $scope.tableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'asc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=customer&action=credit:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                                $scope.credits = data.Items;
                       });

                    }

                });
                $scope.refresh = function(){
                  $scope.tableParams.reload() ;
                    //$scope.credits = credit.getData();
                };
                
                //
               
        }]);

