/* 
 *  controllers - order
 */
angular.module('shop')
        .controller('OrderController',['$scope','$http','$filter','$modal', '$log','ngTableParams',function($scope, $http, $filter, $modal, $log, ngTableParams){

                var saveurl=APPBASE+'index.php?module=order&action=order:save';
                $scope.list = true;
                //
                $scope.orders = [];
                $scope.tva = 0.18;
                $scope.order = {};
                $scope.order.published = 'YES';
                $scope.order.id = null;
                $scope.tableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        createdate: 'desc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=order&action=order:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                                $scope.orders = data.Items;
                       });

                    }

                });
                $scope.refresh = function(){
                  $scope.tableParams.reload() ;
                    //$scope.orders = order.getData();
                };

                $scope.remove = function(id){
                    if(confirm(DEL_CONFIRM)){
                        $scope.delete(id);
                        $scope.refresh();
                    }

                };
                
                //
                
                $scope.details = function (size, index) {
                    $scope.order = $scope.tableParams.data[index];
                    //$scope.loadProduct($scope.order.id);
                    
                    var modalInstance = $modal.open({
                      templateUrl: 'orderModalContent.html',
                      controller: 'ModalInstanceController',
                      size: size,
                      resolve: {
                        order: function () {
                          return $scope.order;
                        }
                      }
                    });

                      modalInstance.result.then(function (selectedItem) {
                        $scope.selected = selectedItem;
                      }, function () {
                        $log.info('Modal dismissed at: ' + new Date());
                      });
                };

        }]).controller('ModalInstanceController', function ($scope,$http, $modalInstance, order) {
            
            $scope.order = order;
            $scope.totalHT = 0;
            $scope.totalTVA = 0;
            $scope.totalReduce = 0;
            $scope.total = 0;
            $scope.voucher = {};
            $scope.voucher.id = 0;
           /* $scope.selected = {
                item: $scope.items[0]
            };*/
            $http.get(APPBASE + 'index.php?module=order&action=orderproduct:read&order_id='+$scope.order.id)
                            .success(function (d) {
                                    $scope.products = d.Items;
                                     $scope.setTotal ();
                            });
            $http.get(APPBASE + 'index.php?module=order&action=order:voucher&order_id='+$scope.order.id)
                            .success(function (d) {
                                    $scope.voucher = d.row;
                            });
            $scope.setTotal = function(){
                    $scope.totalHT = 0;
                    $scope.totalTVA = 0;
                    $scope.totalReduce = 0;
                    $scope.total = 0;
                    
                    angular.forEach( $scope.products, function(item){
                                     $scope.totalHT +=parseInt(item.qty)*parseFloat(item.price);
                                     $scope.totalTVA +=parseInt(item.qty)*parseFloat(item.price)*parseFloat($scope.tva);
                                    /*if(parseFloat(item.reduce) > 0){
                                         $scope.totalReduce+= ((parseInt(item.qty)*parseFloat(item.up)) + (parseInt(item.qty)*parseFloat(item.up)*parseFloat($scope.tva)))*(parseFloat(item.reduce)/100);
                                     }
                                     */
                                    });
                    $scope.totalTVA = parseFloat( $scope.totalHT) * (parseFloat($scope.tva)/100);
//                    if($scope.facture.reduce > 0){
//                        $scope.totalReduce = parseFloat( $scope.totalHT) * (parseFloat($scope.facture.reduce)/100);
//                        $scope.totalHT = parseFloat( $scope.totalHT) - parseFloat( $scope.totalReduce);
//                    }
                    
                    $scope.total = parseFloat( $scope.totalHT) + parseFloat( $scope.totalTVA) ;
                };
            $scope.ok = function () {
                $modalInstance.close();
            };

            $scope.cancel = function () {
                $modalInstance.dismiss('cancel');
            };
            
    })

