/* 
 *
 */

angular.module('houseApp')
        .controller('HouseCtrl',['$scope','$http','$routeParams','$log',function($scope, $http, $routeParams, $log){
                $scope.search.showSearch=false;
                $scope.search.showDetail = true;
                var hurl='http://localhost/topresi/index.php?module=house&action=search:house&id='+$routeParams.houseId;
                $scope.slideTime = 5000;
                $http({
                        method: 'POST', 
                        url: hurl
                
                    }).
                      success(function(data, status) {
                        
                        $scope.house = data;
                        //$scope.data = data;
                      }).
                      error(function(data, status) {
                        $scope.house = {};
                });
                
                 
//                $scope.map = {
//                    center: {
//                        latitude: 5.348542,
//                        longitude: -3.9798626
//                    },
//                    zoom: 8
//                };

                $scope.map = {
                    center: {
                        latitude:  5.348542, 
                        longitude: -3.9798626 
                    }, 
                    zoom: 14 
                };
                
                $scope.options = {
                    scrollwheel: false
                };
                
                $scope.marker = {
                    id: 0,
                    coords: {
                        latitude:  5.348542, 
                        longitude: -3.9798626 
                    },
                    options: { draggable: false },
                    events: {
                      dragend: function (marker, eventName, args) {
                        $log.log('marker dragend');
                        var lat = marker.getPosition().lat();
                        var lon = marker.getPosition().lng();
                        $log.log(lat);
                        $log.log(lon);

                        $scope.marker.options = {
                          draggable: false
                        };
                        /*$scope.marker.options = {
                          draggable: true,
                          labelContent: "lat: " + $scope.marker.coords.latitude + ' ' + 'lon: ' + $scope.marker.coords.longitude,
                          labelAnchor: "100 0",
                          labelClass: "marker-labels"
                        };*/
                        
                      }
                    }
                 };
                
                
                
        }]);




