/* 
 *  BOS core updater 
 */

angular.module('bos')
        .controller('UpdaterController',['$scope','$http',function($scope, $http){
                
               
                $scope.update = function(){
                   $http.get(APPBASE+'index.php?module=bos&action=updater:update')
                        .success(function(d) {
                            
                            if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                                  window.location.href=APPBASE+'#/about';
                            }else{
                              toastr.warning(d.msg,'');
                            }
                        });
                };
               
        }]);

