/* 
 *  Groupe Feature 
 */

angular.module('bos')
        .controller('UserGroupFeatureController',['$scope','$http','$filter','$routeParams','ngTableParams',function($scope, $http, $filter, $routeParams, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=user&action=groupfeature:save';
                $scope.id = $routeParams.group;
                $scope.group = {};
                //
                $scope.features = [];
                $scope.groupfeatures = [];
                $scope.groupfeaturesTableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'desc'     // initial sorting
                    },
                    filter :{
                      group_id :  $scope.id
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=user&action=groupfeature:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });

                    }

                });

                 $scope.featuresTableParams = new ngTableParams({
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

                  $http.get(APPBASE + 'index.php?module=user&action=group:view&id='+$scope.id)
                       .success(function (d) {
                                $scope.group = d.row;
                       });


                $scope.add = function(id){
                    $http.get(APPBASE + 'index.php?module=user&action=groupfeature:save&group_id='+$scope.id+'&feature_id='+id)
                       .success(function (d) {
                                if(d.success){
                                    toastr.success(d.msg,OP_GOOD);
                                    $scope.refresh();
                                }else{
                                  toastr.error(d.msg,OP_BAD);
                                }
                       });
                };
                $scope.remove = function(id){
                    $http.get(APPBASE + 'index.php?module=user&action=groupfeature:delete&group_id='+$scope.id+'&feature_id='+id)
                       .success(function (d) {
                                if(d.success){
                                    toastr.success(d.msg,OP_GOOD);
                                    $scope.refresh();
                                }else{
                                  toastr.error(d.msg,OP_BAD);
                                }
                       });
                };

                $scope.removeAll = function(){
                    if($scope.getSetectedGroupFeatures().length <1){
                        alert(NO_ROW);
                        return;
                    }
                    
                        angular.forEach($scope.getSetectedGroupFeatures(), function(i) {
                            $scope.remove(i.id);
                        });
                        $scope.refresh();
                                      
                };

                $scope.addAll = function(){
                    if($scope.getSetected().length <1){
                        alert(NO_ROW);
                        return;
                    }
                    
                        angular.forEach($scope.getSetected(), function(i) {
                            $scope.add(i.id);
                        });
                        $scope.refresh();
                                      
                };
                
                $scope.getSetected = function () {
                      return $filter('filter')($scope.featuresTableParams.data, {checked: true});
                };

                $scope.getSetectedGroupFeatures = function () {
                      return $filter('filter')($scope.groupfeaturesTableParams.data, {checked: true});
                };

                $scope.refresh = function(){
                     $scope.groupfeaturesTableParams.reload();
                     $scope.featuresTableParams.reload();
                };
                
                $scope.refresh();
               
        }]);




