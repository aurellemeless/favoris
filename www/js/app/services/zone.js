/* 
 * services - zone
 */

angular.module('shop')
        .factory('zone', ['$http', function ($http) {
                var cats = {};
                cats.data = [];
                cats.read = function () {
                    $http({
                        method: 'POST',
                        url: APPBASE + 'index.php?module=parametre&action=zone:read'
                    })
                            .success(function (data) {
                                cats.data = data.Items;

                            });
                };
                /**
                 * get categories
                 * @returns {cats.data}
                 */
                cats.getData = function () {
                    cats.read();
                    
                    return cats.data;
                };
                
                cats.read();
               
                return cats;

            }]);
