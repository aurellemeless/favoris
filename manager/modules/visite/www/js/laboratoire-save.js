/* 
 *  Controller Laboratoire - Save 
 */

angular.module('bos')
        .controller('LaboratoireSaveController',['$scope','$http','$filter','ngTableParams',function($scope, $http, $filter, ngTableParams){
                
                var saveurl=APPBASE+'index.php?module=visite&action=laboratoire:save';
                $scope.list = true;
                $scope.ico = APPBASE+'www/images/candidat.png';
                //
                $scope.laboratoires = [];
                $scope.laboratoire = {};
                $scope.laboratoire.id = null;
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
                        $http.get(APPBASE + 'index.php?module=visite&action=laboratoire:pending',{params : params.$params})
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
                    $scope.laboratoire = $scope.tableParams.data[index];
                    $scope.list = false;
                };
               
                $scope.save = function(laboratoire,back){
                    if(laboratoire.$valid){
                        var formElement = document.getElementById("form_laboratoire");
                        var formData = new FormData(formElement);
                        formData.append("id", $scope.laboratoire.id);
                        
                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.laboratoire),  // pass in data as strings
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
                    document.form_laboratoire.reset();
                    $scope.laboratoire = {};
                    $scope.form_laboratoire.$setPristine();
                   
                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_laboratoire[field].$invalid && $scope.form_laboratoire[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_laboratoire[field].$valid && $scope.form_laboratoire[field].$dirty;
                };

               
        }]);




