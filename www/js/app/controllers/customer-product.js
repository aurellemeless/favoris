/*
 *  Product
 */

angular.module('shop')
        .controller('CustomerProductController',['$scope','$http','$filter','FileUploader','ngTableParams',function($scope, $http, $filter, FileUploader,ngTableParams){

                var saveurl=APPBASE+'index.php?module=customer&action=product:save';
                $scope.list = true;
                //
                $scope.products = [];
                $scope.categories = [];
                $scope.producttags = [];
                $scope.producttaxes = [];
                $scope.olds = [];
                $scope.ptTab = [];
                $scope.ptaxesTab = [];
                $scope.tags = [];
                $scope.taxes = [];
                $scope.tagtypes = [];
                $scope.labels = [];
                $scope.forms = [];
                $scope.parents = [];
                $scope.product = {};
                $scope.product.published = 'YES';
                $scope.product.id = null;
                $scope.product.category_id = null;
                $scope.product.label_id = null;
                $scope.product.start_old_id = null;
                $scope.product.end_old_id = null;
                $scope.tag_id = null;
                $scope.tagtype_id = null;
                $scope.operation = {};
                $scope.operation.show = false;
               $scope.editorOptions = {
                    language: 'fr'
                   // uiColor: '#000000'
                };
                $scope.$on("ckeditor.ready", function( event ) {
                    $scope.isReady = true;
                }); /**/
                
                //grid
                 $scope.tableParams = new ngTableParams({
                    page: 1,            // show first page
                    count: 10,          // count per page
                    sorting: {
                        id: 'asc'     // initial sorting
                    }

                }, {
                    total: 0,           // length of data
                    getData: function($defer, params) {
                        $http.get(APPBASE + 'index.php?module=customer&action=product:read',{params : params.$params})
                       .success(function (data) {
                                //$scope.total = data.Count;
                                params.total(data.Count);
                                // set new data
                                $defer.resolve(data.Items);
                                $scope.products = data.Items;
                       });

                    }

                });


                $scope.refresh = function(){
                     $scope.tableParams.reload();
                };

                $scope.getCategories = function () {
                    $http.get( APPBASE + 'index.php?module=catalog&action=category:readOptions')
                            .success(function (data) {
                                $scope.categories = data.Items;

                            });
                };
                $scope.getOlds = function () {
                    $http.get( APPBASE + 'index.php?module=catalog&action=old:read')
                            .success(function (data) {
                                $scope.olds = data.Items;

                            });
                };
                $scope.getLabels = function () {
                    $http.get(APPBASE + 'index.php?module=catalog&action=label:read')
                            .success(function (data) {
                                $scope.labels = data.Items;

                            });
                };

                $scope.getTagtype = function () {
                    $http.get( APPBASE + 'index.php?module=catalog&cb=1&action=categorytagtype:read&category_id='+$scope.product.category_id)
                            .success(function (data) {
                                $scope.tagtypes = data.Items;

                            });
                };

                $scope.getTag = function () {
                    $http({
                        method: 'POST',
                        url: APPBASE + 'index.php?module=catalog&action=tag:read&cb=1'
                    })
                            .success(function (data) {
                                $scope.tags = data.Items;

                            });
                };
                
                
                $scope.getTaxes = function () {
                    $http({
                        method: 'POST',
                        url: APPBASE + 'index.php?module=catalog&action=tax:read&cb=1'
                    })
                            .success(function (data) {
                                $scope.taxes = data.Items;

                            });
                };
                
                $scope.setTag = function () {

                    angular.forEach($scope.tags, function(i) {
                            if( (i.id==$scope.tag_id) && ($scope.ptTab.indexOf(i.id) < 0)){
                                console.log('Tag'+i.id+' ajouté');
                                $scope.ptTab.push(i.id);
                                $scope.producttags.push(i);
                            };
                        });


                };
                
                $scope.setTax = function () {

                    angular.forEach($scope.taxes, function(i) {
                            if( (i.id==$scope.tax_id) && ($scope.ptaxesTab.indexOf(i.id) < 0)){
                                console.log('Taxe '+i.id+' ajouté');
                                $scope.ptaxesTab.push(i.id);
                                $scope.producttaxes.push(i);
                            };
                        });


                };

                $scope.new = function(){
                    $scope.list = false;
                    $scope.product.id = null;
                    $scope.product.form_id = null;
                    $scope.producttags = [];
                    $scope.producttaxes = [];
                };
                $scope.securize = function(index){
                   $http.get( APPBASE + 'index.php?module=customer&action=product:security')
                            .success(function (data) {
                                 document.getElementById("appkey_product").value=data.token;
                               // $scope.appkey = data.appkey;
                            });
                };

                $scope.edit = function(index){
                    $scope.producttags = [];
                    $scope.producttaxes = [];
                    $scope.product =  $scope.tableParams.data[index];
                    //$scope.product.image = null;
                     $http.get( APPBASE + 'index.php?module=catalog&action=producttag:read&product_id='+$scope.product.id)
                            .success(function (data) {
                                $scope.producttags = data.Items;
                            });
                    $scope.list = false;
                    $http.get( APPBASE + 'index.php?module=catalog&action=producttax:read&product_id='+$scope.product.id)
                            .success(function (data) {
                                $scope.producttaxes = data.Items;
                            });
                    $scope.list = false;

                };

                $scope.save = function(product,back){
                    if(product.$valid){
                        /*if( product.$pristine){
                            toastr.success('Catégorie modifiée',OP_GOOD+' '+$scope.product.title);
                            $scope.list = true;
                            return;
                        }*/
                        var formElement = document.getElementById("form_product");
                        var formData = new FormData(formElement);
                        var tabTag = $scope.ptTab;
                        if($scope.product.image!=null)
                            formData.append("image", $scope.product.image);
                        formData.append("id", $scope.product.id);
                        formData.append("description", $scope.product.description);
                        formData.append("other", $scope.product.other);
                        angular.forEach($scope.ptTab, function(i) {
                           formData.append("tags[]",i);
                        });
                        angular.forEach($scope.ptaxesTab, function(i) {
                           formData.append("taxes[]",i);
                        });
                        //formData.append("tags[]",tabTag);

                        $http({
                            method  : 'POST',
                            url     : saveurl,
                            data    : formData,
                            //data    : $.param($scope.product),  // pass in data as strings
                            //headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
                            headers : { 'Content-Type': undefined },
                            transformRequest: formData
                        })
                        .success(function(d) {
                              $scope.operation = d;
                              if(d.success){
                                    toastr.success(d.msg,OP_GOOD+' '+$scope.product.title);
                                    $scope.formReset();
                                   /* $scope.refresh();
                                    if(back)
                                        $scope.list = true;*/
                              }else{
                                    toastr.error(d.msg,OP_BAD);
                              }

                        });


                    }
                };

                $scope.remove = function(id){
                    if(confirm(DEL_CONFIRM)){
                        product.delete(id);
                        $scope.refresh();
                        $scope.getParents();
                    }

                };
                $scope.removeTag = function(index){
                    var id = $scope.producttags[index].tag_id;
                    if(confirm(DEL_CONFIRM)){
                         $http.get( APPBASE + 'index.php?module=catalog&action=producttag:delete&product_id='+$scope.product.id+'&tag_id='+id)
                            .success(function (data) {
                                $scope.producttags.splice(index,1);
                            });
                    }

                };
                $scope.removeTax = function(index){
                    var id = $scope.producttaxes[index].tax_id;
                    if(confirm(DEL_CONFIRM)){
                         $http.get( APPBASE + 'index.php?module=catalog&action=producttax:delete&product_id='+$scope.product.id+'&tax_id='+id)
                            .success(function (data) {
                                $scope.producttaxes.splice(index,1);
                            });
                    }

                };
                $scope.trashAll = function(){
                    if($scope.getSetected().length <1){
                        alert(NO_ROW);
                        return;
                    }
                    if(confirm(TRASH_CONFIRM)){
                        angular.forEach($scope.getSetected(), function(i) {
                            $scope.trash(i.id);
                        });
                        $scope.refresh();
                        $scope.getParents();
                    }

                };

                $scope.getSetected = function () {
                      return $filter('filter')($scope.tableParams.data, {checked: true});
                };

                $scope.trashRow = function(id){

                    if(confirm(DEL_CONFIRM)){
                        $scope.trash(id);
                        $scope.refresh();
                    }

                };
                $scope.removeImage = function(index, image){
                    if(confirm(DEL_ONE_CONFIRM)){
                        $scope.deleteImage($scope.product.id,image);
                        $scope.product.image.splice(index,1);
                    }

                };
                //services
                $scope.delete = function (id) {
                    var back = {};
                    $http({
                            method: 'POST',
                            url: APPBASE + 'index.php?module=customer&action=product:delete&id='+id
                        })
                            .success(function (d) {
                                    if(d.success){
                                        toastr.success(d.msg,OP_GOOD);
                                    }else{
                                        toastr.error(d.msg,OP_BAD);
                                    }

                            });



                    return back;
                };
                $scope.deleteImage = function (id,image) {
                    $http.get(APPBASE + 'index.php?module=customer&action=product:removePhoto&id='+id+'&p='+image)
                            .success(function (d) {
                                    if(d){
                                        toastr.success(d.msg,OP_GOOD);
                                    }else{
                                        toastr.error(d.msg,OP_BAD);
                                    }

                            });
                };
                $scope.trash = function (id) {
                    var back = {};
                    $http.get( APPBASE + 'index.php?module=customer&action=product:trash&id='+id)
                            .success(function (d) {
                                    if(d.success){
                                        toastr.success(d.msg,OP_GOOD);
                                    }else{
                                        toastr.error(d.msg,OP_BAD);
                                    }

                            });

                    return back;
                };


                $scope.formReset = function(){
                    window.location.reload();

                };
                //validation
                 $scope.isInvalid = function(field){
                        return $scope.form_product[field].$invalid && $scope.form_product[field].$dirty;
                 };

                 $scope.isValid = function(field){
                        return $scope.form_product[field].$valid && $scope.form_product[field].$dirty;
                };


                //$scope.refresh();
                $scope.getCategories();
                $scope.getLabels();
                $scope.getTagtype();
                $scope.getTag();
                $scope.getTaxes();
                $scope.getOlds();
               
                $scope.$watch('list', function() {
                    $scope.securize();
                  });

                 $scope.$watch('product.category_id', function() {
                    $scope.getTagtype();
                  });




    var uploader = $scope.uploader = new FileUploader({
            url: APPBASE+'index.php?module=customer&action=product:upload',
            autoUpload:false
        });

        // FILTERS

        uploader.filters.push({
            name: 'customFilter',
            fn: function(item /*{File|FileLikeObject}*/, options) {
                return this.queue.length < 10;
            }
        });

        // CALLBACKS

        uploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/, filter, options) {
            console.info('onWhenAddingFileFailed', item, filter, options);
        };
        uploader.onAfterAddingFile = function(fileItem) {
            console.info('onAfterAddingFile', fileItem);
        };
        uploader.onAfterAddingAll = function(addedFileItems) {
            console.info('onAfterAddingAll', addedFileItems);
        };
        uploader.onBeforeUploadItem = function(item) {
            console.info('onBeforeUploadItem', item);
        };
        uploader.onProgressItem = function(fileItem, progress) {
            console.info('onProgressItem', fileItem, progress);
        };
        uploader.onProgressAll = function(progress) {
            console.info('onProgressAll', progress);
        };
        uploader.onSuccessItem = function(fileItem, response, status, headers) {
            console.info('onSuccessItem', fileItem, response, status, headers);
        };
        uploader.onErrorItem = function(fileItem, response, status, headers) {
            console.info('onErrorItem', fileItem, response, status, headers);
        };
        uploader.onCancelItem = function(fileItem, response, status, headers) {
            console.info('onCancelItem', fileItem, response, status, headers);
        };
        uploader.onCompleteItem = function(fileItem, response, status, headers) {
            console.info('onCompleteItem', fileItem, response, status, headers);
        };
        uploader.onCompleteAll = function() {
            console.info('onCompleteAll');
        };

        console.info('uploader', uploader);


 }])
  /**
    * The ng-thumb directive
    * @author: nerv
    * @version: 0.1.2, 2014-01-09
    */
    .directive('ngThumb', ['$window', function($window) {
        var helper = {
            support: !!($window.FileReader && $window.CanvasRenderingContext2D),
            isFile: function(item) {
                return angular.isObject(item) && item instanceof $window.File;
            },
            isImage: function(file) {
                var type =  '|' + file.type.slice(file.type.lastIndexOf('/') + 1) + '|';
                return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
            }
        };

        return {
            restrict: 'A',
            template: '<canvas/>',
            link: function(scope, element, attributes) {
                if (!helper.support) return;

                var params = scope.$eval(attributes.ngThumb);

                if (!helper.isFile(params.file)) return;
                if (!helper.isImage(params.file)) return;

                var canvas = element.find('canvas');
                var reader = new FileReader();

                reader.onload = onLoadFile;
                reader.readAsDataURL(params.file);

                function onLoadFile(event) {
                    var img = new Image();
                    img.onload = onLoadImage;
                    img.src = event.target.result;
                }

                function onLoadImage() {
                    var width = params.width || this.width / this.height * params.height;
                    var height = params.height || this.height / this.width * params.width;
                    canvas.attr({ width: width, height: height });
                    canvas[0].getContext('2d').drawImage(this, 0, 0, width, height);
                }
            }
        };
    }]);
