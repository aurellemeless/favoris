/* 
 *  Controller Laboratoire - Result 
 */

angular.module('bos')
        .controller('LaboratoireResultController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
               
                $scope.list = true;
                $scope.ico = APPBASE+'www/images/candidat.png';
                //
                $scope.laboratoire = {};
                $scope.laboratoire.id = null;
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
                        $http.get(APPBASE + 'index.php?module=visite&action=laboratoire:finished',{params : params.$params})
                       .success(function (data) {
                                $scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });

                    }

                });
                 $scope.formReset = function(){
                    document.form_laboratoire.reset();
                    $scope.laboratoire = {};
                    $scope.form_laboratoire.$setPristine();
                   
                };
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.laboratoire = $scope.tableParams.data[index];
                    $scope.list = false;
                };
               
                
               
        }]);




