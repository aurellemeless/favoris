/* 
 *  Controller Candidat - Result 
 */

angular.module('bos')
        .controller('CandidatController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
               
                $scope.list = true;
                $scope.ico = APPBASE+'www/images/candidat.png';
                //
                $scope.candidat = {};
                $scope.candidat.id = null;
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
                        $http.get(APPBASE + 'index.php?module=visite&action=candidat:read',{params : params.$params})
                       .success(function (data) {
                                $scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });

                    }

                });
                 $scope.formReset = function(){
                    document.form_candidat.reset();
                    $scope.candidat = {};
                    $scope.form_candidat.$setPristine();
                   
                };
                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.candidat = $scope.tableParams.data[index];
                    $scope.list = false;
                };
               
                
               
        }]);




