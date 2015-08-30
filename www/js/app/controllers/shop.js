/*
 *init shop file
 *
*/
var APPBASE = '/';
var OP_GOOD = 'Opération réussie';
var OP_BAD = 'Opération Echouée';
var NO_ROW = 'Aucun élément sélectionné';
var DEL_CONFIRM = 'Voulez-vous vraiment supprimer cet élément ?';
angular.module('shop', ['ngTable','ui.bootstrap','angularFileUpload','ngCkeditor','ui.tinymce'])
       .controller('ShopController',['$scope','$http','$filter', function($scope, $http,$filter){
                
                $scope.search = {};
                $scope.basket = {};
                $scope.basket.taxes=[];
                $scope.onlyNumbers = '^[0-9]+$';
                $scope.promos=[];
                
                $scope.categories=[];
                //search form
                $scope.search.category=null;
                $scope.search.word='';
                $scope.search.commune=null;
                $scope.search.selected={};
                $scope.basket.total=null;
                $scope.basket.ttc=null;
                $scope.basket.rowQty=1;
                $scope.basket.count=null;
                $scope.basket.rules = {};
                $scope.basket.products=[];
                $scope.helpUrl =  APPBASE+'index.php?module=shop&action=search:read&category='+$scope.search.category+'&word=';
                            
                 //taxes
                $http.get(APPBASE+'index.php?module=catalog&action=tax:read').
                      success(function(data, status) {
                        $scope.basket.taxes = data.Items;
                        /*for(i=0;i<$scope.basket.taxes.length;i++){
                            $scope.basket.eval(basket.taxes[0].title) = 0.0; 
                        }*/
                      }).
                      error(function(data, status) {
                        console.log('ERROR loading taxes');
                    });
                  
                $scope.basket.read = function(){
                        $http.get(APPBASE+'index.php?module=order&action=basket:read').
                        success(function(data, status) {
                           $scope.basket.products = data.Items;
                           //$scope.basket.count = data.Count;
                           $scope.basket.setTotal();
                        }).
                        error(function(data, status) {
                        
                    });
                };
                $scope.basket.getRules = function(){
                    $http.get(APPBASE+'index.php?module=order&action=basket:rules').
                        success(function(data, status) {
                           $scope.basket.rules = data.row;
                        }).
                        error(function(data, status) {
                        
                    });
                };
                $scope.basket.add = function(id){
                         $http.get(APPBASE+'index.php?module=order&action=basket:add&qty='+$scope.basket.rowQty+'&id='+id).
                        success(function(data, status) {
                           if(data.success){
                               toastr.success(data.msg,OP_GOOD);
                               $scope.basket.read();
                               $scope.basket.setTotal();
                           }else{
                              toastr.error(data.msg,OP_BAD);
                           }
                        }).
                        error(function(data, status) {
                        
                    });
            
                };
                
                $scope.basket.remove = function(index){
                        var prod = $scope.basket.products[index];
                        if(index > -1){
                            if(confirm("Voulez vous vraiment retirer ce produit de votre panier ? ")){
                                
                                $http.get(APPBASE+'index.php?module=order&action=basket:delete&id='+prod.id).
                                success(function(data, status) {
                                   if(data.success){
                                       $scope.basket.products.splice(index,1);
                                       $scope.basket.setTotal();
                                       //$scope.basket.read();
                                       toastr.success(data.msg,OP_GOOD);
                                   }else{
                                       toastr.success(data.msg,OP_BAD);
                                   }
                                }).
                                error(function(data, status) {

                                });
                            }
                                
                        }
                        
                };
                 $scope.basket.qtyPlus = function(index){
                            var qty =  parseInt($scope.basket.products[index].qty);
                            $scope.basket.products[index].qty = parseInt(qty+1);
            
                };
                $scope.basket.qtyMinus = function(index){
                            var qty =  parseInt($scope.basket.products[index].qty);
                           if(qty > 1){
                               $scope.basket.products[index].qty = qty-1;
                           }else{
                              $scope.basket.products[index].qty = 1 ;
                           }
            
                };
                
                 $scope.rowQtyPlus = function(){
                            var qty =  parseInt($scope.basket.rowQty);
                           $scope.basket.rowQty = parseInt(qty+1);
            
                };
                $scope.rowQtyMinus = function(){
                            var qty =  parseInt($scope.basket.rowQty);
                           if(qty > 1){
                              $scope.basket.rowQty = qty-1;
                           }else{
                              $scope.basket.rowQty = 1 ;
                           }
            
                };
                   $scope.autoNumber = function(index) {
                    $scope.basket.products[index].qty = $scope.basket.products[index].qty.replace(/[^0-9\-\s]/g, '').replace(/\s+/g, '');
                };
                $scope.basket.setTotal = function(){
                    var total = 0;
                    var count = 0;
                    var tax = 0.0;
                    var totalTax = 0.0;
                    $scope.basket.resetTaxes();
                    if($scope.basket.products.length){
                        angular.forEach($scope.basket.products, function(i) {
                             total += parseFloat(i.price) * parseInt(i.qty);
                             count += parseInt(i.qty);
                             for(j=0;j<$scope.basket.taxes.length;j++){
                                 try{
                                     if(i.taxes.length>0 && i.taxes.indexOf($scope.basket.taxes[j].id) >=0){
                                        // taxIndex = i.taxes.indexOf($scope.basket.taxes[j].id)
                                         tax = parseFloat( $scope.basket.taxes[j].price);
                                         $scope.basket.taxes[j].price = tax;
                                         $scope.basket.taxes[j].price += parseFloat(i.price)* parseFloat(i.qty)*parseFloat($scope.basket.taxes[j].rate)/100;
                                         console.log('taxe '+j+': '+ $scope.basket.taxes[j].price);
                                         totalTax += parseFloat($scope.basket.taxes[j].price);
                                     } 
                                     
                                 }catch(e){}
                                
                            }
                             
                        });
                    }
                        
                        $scope.basket.total = total;
                        $scope.basket.count = count;
                        $scope.basket.taxesTotal = totalTax;
                        $scope.basket.ttc = total;
                };
                
                $scope.basket.resetTaxes = function(){
                    for(j=0;j<$scope.basket.taxes.length;j++){
                        $scope.basket.taxes[j].price = 0.0;
                        $scope.basket.taxesTotal = 0.0;
                    }
                };
                $scope.go = function(){
                   // $scope.search
                   var data = '&category='+$scope.search.category+'&word='+$scope.search.word;
                    window.location.href=APPBASE+'index.php?module=shop&action=search:index'+data;
                };
                
                $scope.help = function(){
                        var prodUrl = APPBASE+'index.php?module=shop&action=search:read';
                };
                
                $scope.basket.read();
                $scope.basket.getRules();
//                $scope.checkout = function(){
//                    
//                     var data ={basket : $scope.basket.products};
//                    $http({
//                            method  : 'POST',
//                            url     : APPBASE+'index.php?module=shop&action=indent:save',
//                            data    : $.param(data),  // pass in data as strings
//                            headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
//                           // headers : { 'Content-Type': undefined },
//                            //transformRequest: data
//                        })
//                        .success(function(d,status) {
//                              if(d.success){
//                                      window.open(APPBASE+'index.php?module=shop&action=indent:ticket&id='+d.id);
//                                      //alert(data.msg);
//                                   }else{
//                                       alert(d.msg);
//                                   }
//
//                        }).
//                           error(function(d, status) {
//
//                                });
//                    
//                    console.log('commande en cours de validation');
//                };
                
           
            
            
        }]).filter('shopDate', function myDateFormat($filter){
                        return function(text){
                            var  tempdate= new Date(text.replace(/-/g,"/"));
                            return $filter('date')(tempdate, "dd-MMMM-yyyy HH:mm:ss");
                        }
              });




