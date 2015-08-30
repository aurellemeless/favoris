/* 
 *  controllers - basket
 */
angular.module('shop')
        .controller('DeliveryController',['$scope','$http','$filter','shopdate',function($scope, $http, $filter, shopdate){
//                       $scope.basket.read();
//                       $scope.basket.setTotal();
                $scope.delivery = {};
                $scope.user = {};
                $scope.delivery.commune_id = null;
                $scope.days = shopdate.days;
                $scope.monthes = shopdate.monthes;
                $scope.years = shopdate.years;
                $scope.zones = [];
                $scope.communes = [];
                $scope.allCommunes = [];
                $scope.loadUser = function () {
                    $http.get(APPBASE + 'index.php?module=user&action=user:current')
                            .success(function (data) {
                                $scope.user = data;
                            });
                };
                $scope.loadZones = function () {
                    $http.get(APPBASE + 'index.php?module=shipping&action=zone:read')
                            .success(function (data) {
                                $scope.zones = data.Items;

                            });
                };
                
                $scope.loadCommunes = function () {
                    $http.get(APPBASE + 'index.php?module=shipping&action=commune:read')
                            .success(function (data) {
                                $scope.allCommunes = data.Items;

                            });
                };
                $scope.filterCommunes = function(){
                    //console.log('Zone : '+$scope.delivery.zone_id);
                     $scope.delivery.commune_id = null ;
                    $scope.communes = $filter('filter')($scope.allCommunes, {zone_id: $scope.delivery.zone_id});
                    
                };
                $scope.back = function(){
                          // $location.path('/basket');
                          window.location.href=APPBASE+'index.php?module=order&action=basket:index'; 
                };        
                $scope.next = function(){
//                        if(form_delivery.$invalid){
//                            return false;
//                        }
                        var data ={delivery : $scope.delivery, user:$scope.user};
                        $http({
                                method  : 'POST',
                                url     : APPBASE+'index.php?module=order&action=delivery:save',
                                data    : $.param(data),  // pass in data as strings
                                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                               // headers : { 'Content-Type': undefined },
                                //transformRequest: data
                            })
                            .success(function(d,status) {
                                  if(d.success){
                                         //$location.path('/recap');
                                        window.location.href=APPBASE+'index.php?module=order&action=recap:index'; 
                                    }else{
                                        alert(d.msg);
                                    }

                            }).
                               error(function(d, status) {

                                    });
                };
                
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_delivery[field].$invalid && $scope.form_delivery[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_delivery[field].$valid && $scope.form_delivery[field].$dirty;
                };
                
                $scope.loadZones();
                $scope.loadCommunes();  
                $scope.loadUser();
        }]);


