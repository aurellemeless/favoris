/* 
 *  Controller Radiologie - Result 
 */

angular.module('bos')
        .controller('RadiologieResultController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
               
                $scope.list = true;
                $scope.ico = APPBASE+'www/images/candidat.png';
                //
                $scope.radiologie = {};
                $scope.radiologie.id = null;
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
                        $http.get(APPBASE + 'index.php?module=visite&action=radiologie:finished',{params : params.$params})
                       .success(function (data) {
                                $scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });

                    }

                });
                 $scope.formReset = function(){
                    document.form_radiologie.reset();
                    $scope.radiologie = {};
                    $scope.form_radiologie.$setPristine();
                   
                };
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.radiologie = $scope.tableParams.data[index];
                    $scope.list = false;
                };
               
                
               
        }]);




