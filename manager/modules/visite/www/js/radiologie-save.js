/* 
 *  Controller Radiologie - Save 
 */

angular.module('bos')
        .controller('RadiologieSaveController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=visite&action=radiologie:save';
                $scope.list = true;
                $scope.ico = APPBASE+'www/images/candidat.png';
                //
                $scope.radiologies = [];
                $scope.radiologie = {};
                $scope.radiologie.id = null;
                $scope.operation = {};
                $scope.operation.show = false;
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
                        $http.get(APPBASE + 'index.php?module=visite&action=radiologie:pending',{params : params.$params})
                       .success(function (data) {
                                $scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                       });

                    }

                });

                $scope.edit = function(index){
                    $scope.formReset();
                    $scope.radiologie = $scope.tableParams.data[index];
                    $scope.list = false;
                };
               
                $scope.save = function(radiologie,back){
                    if(radiologie.$valid){
                        var formElement = document.getElementById("form_radiologie");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.radiologie.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.radiologie),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                  toastr.success(d.msg,OP_GOOD);
                                  $scope.formReset();
                                  $scope.refresh();
                                  if(back)
                                      $scope.list = true;
                              }else{
                                toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };
               
                $scope.formReset = function(){
                    document.form_radiologie.reset();
                    $scope.radiologie = {};
                    $scope.form_radiologie.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_radiologie[field].$invalid && $scope.form_radiologie[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_radiologie[field].$valid && $scope.form_radiologie[field].$dirty;
                };

               
        }]);




