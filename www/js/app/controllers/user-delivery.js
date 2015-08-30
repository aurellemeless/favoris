/* 
 *  controllers - user-delivery
 */

$(function(){
    //Click event to scroll to top
	$('.remonte').click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});
});

angular.module('shop')
        .controller('UserDeliveryController',['$scope','$http','$filter','$modal', '$log','ngTableParams',function($scope, $http, $filter, $modal, $log, ngTableParams){

               
            $scope.delivery = {};
            $scope.delivery.id = null;
            $scope.delivery.commune_id = null;
            $scope.delivery.zone_id = null;
                // $scope.delivery = {};
            $scope.form = false;
            $scope.zones = [];
            $scope.communes = [];
            $scope.allCommunes = [];
            $scope.commune = null;
            $scope.zone = null;
                
                $scope.tableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'asc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=order&action=userdelivery:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });

                    }

                });
                $scope.add = function(){
                  $scope.form = true;
                  $scope.formReset(); 
                };
                $scope.refresh = function(){
                  $scope.tableParams.reload() ;
                    //$scope.deliverys = delivery.getData();
                };
                    
                $scope.formReset = function(){
                    //document.form_delivery.reset();
                    $scope.delivery = {};
                    $scope.delivery.commune_id = null;
                    $scope.delivery.id = null;
                    $scope.form_delivery.$setPristine();
                   
                };
                
                $scope.remove = function(id){
                    if(confirm(DEL_CONFIRM)){
                        $scope.delete(id);
                        $scope.refresh();
                    }

                };
                
                $scope.delete = function(id){
                   $http.get(APPBASE + 'index.php?module=order&action=userdelivery:delete&id='+id)
                            .success(function (d) {
                                    if(d.success){
                                        toastr.success(d.msg,OP_GOOD);
                                    }else{
                                        toastr.error(d.msg,OP_BAD);
                                    }
                            });  
                };
                
                
                //validation
                 $scope.isInvalid = function(f){
                        return $scope.form_delivery[f].$invalid && $scope.form_delivery[f].$dirty;
                 };

                 $scope.isValid = function(f){
                        return $scope.form_delivery[f].$valid && $scope.form_delivery[f].$dirty;
                };
                //
                
                $scope.edit = function (index) {
                    $scope.formReset(); 
                    $scope.delivery = $scope.tableParams.data[index];
                    $scope.commune =  $scope.delivery.commune_id;
                    $scope.zone =  $scope.delivery.zone_id;
                    $scope.form = true;
                };
                 $scope.filterCommunes = function(){
                    //console.log('Zone : '+$scope.delivery.zone_id);
                    $scope.delivery.commune_id = null;
                    $scope.communes = $filter('filter')($scope.allCommunes, {zone_id: $scope.delivery.zone_id});
                    
                };
                
                
                $scope.save = function(form){
                    if(form.$valid){
                         if( form.$pristine){
                            toastr.success('Adresse de livraison modifiée',OP_GOOD+' '+$scope.delivery.title);
                            $scope.cancel();
                            return;
                        }
                        var formElement = document.getElementById("form_delivery");
                        var formData = new FormData(formElement);
                        //formData.append("image", $scope.delivery.image);
                        formData.append("id", $scope.delivery.id);
                        
                        $http({
                            method  : 'POST',
                            url     : APPBASE + 'index.php?module=order&action=userdelivery:save',
                            data    : formData,
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              if(d.success){
                                  
                                  toastr.success(d.msg,OP_GOOD+' '+$scope.delivery.title);
                                  window.location.reload();
                                  
                                  
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
                
                 $http.get(APPBASE + 'index.php?module=shipping&action=zone:read')
                            .success(function (data) {
                                $scope.zones = data.Items;

                            });
                $http.get(APPBASE + 'index.php?module=shipping&action=commune:read')
                            .success(function (d) {
                                    $scope.communes = d.Items;
                                    $scope.allCommunes = d.Items;
                            });
                

        }]);

