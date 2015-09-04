/* 
 *  Favorite Link Add
 */
angular.module('df')
        .controller('LinkAddController',['$scope','$http','$location',function($scope, $http, $location){
                
                var saveurl=APPBASE+'index.php?module=link&action=link:create';
                
                //subscribe form
                $scope.link = {};
                $scope.categories = [];
                $scope.link.category_id = null;
                 $http.get(APPBASE + 'index.php?module=link&action=category:read&cb=1')
                            .success(function (d) {
                                    $scope.categories = d.Items;
                            });
                $scope.save = function(link,back){
                    if(link.$valid){
                        var formElement = document.getElementById("form_link");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.link.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.link),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                  //toastr.success(d.msg,OP_GOOD+' '+$scope.link.title);
                                  $location.path('/link');
                              }else{
                                //toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
                
                $scope.checkLink = function(field,q){
                    if($scope.form_link[field].$valid){
                         //communes
                        $http.get(APPBASE+'index.php?module=link&action=link:ckeckEmail&q='+q).
                              success(function(data, status) {
                                $scope.checker.exist= data.exist;
                              }).
                              error(function(data, status) {
                                console.log('ERROR checking email');
                            });
                    }
                };
                
                $scope.formReset = function(){
                    document.form_link.reset();
                    $scope.link = {};
                    $scope.form_link.$setPristine();
                };
                //validation
                $scope.isInvalid = function(field){
                        return $scope.form_link[field].$invalid && $scope.form_link[field].$dirty;
                };

                $scope.isValid = function(field){
                        return $scope.form_link[field].$valid && $scope.form_link[field].$dirty;
                };

                
        }]);




