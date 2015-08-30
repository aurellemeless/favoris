/* 
 * 
 */

angular.module('houseApp')
        .directive('search', function() {
            return {
                restrict: 'E',
                templateUrl: 'http://localhost/topresi/index.php/house/search/directive'
            };
        })
        .directive('searchfilter', function() {
            return {
                restrict: 'E',
                templateUrl: 'http://localhost/topresi/index.php/house/search/filter'
            };
        });
        
        


