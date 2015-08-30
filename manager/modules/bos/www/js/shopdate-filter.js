angular.module('bos')
        .filter('shopDate', function myDateFormat($filter){
                        return function(text){
                            var  tempdate= new Date(text.replace(/-/g,"/"));
                            return $filter('date')(tempdate, "dd-MMMM-yyyy");
                        }
              })
        .filter('shopDatetime', function myDateFormat($filter){
                        return function(text){
                            var  tempdate= new Date(text.replace(/-/g,"/"));
                            return $filter('date')(tempdate, "dd-MMMM-yyyy HH:mm:ss");
                        }
              });