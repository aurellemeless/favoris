/* 
 * services - shopdate
 */

angular.module('shop')
        .factory('shopdate', ['$http', function ($http) {
                var cats = {};
                 cats.days = [];
                var i =1;
                for( i=1;i<=31;i++){
                   
                    if(i<10){
                        cats.days.push('0'+i);
                    }else{
                        cats.days.push(i);
                    }
                }
                
                cats.monthes = [];
                i =1;
                for( i=1;i<=12;i++){
                    if(i<10){
                        cats.monthes.push('0'+i);
                    }else{
                        cats.monthes.push(i);
                    }
                    
                }
                
                cats.years = [];
                
                var cur = new Date().getFullYear();
                var max = parseInt(cur) - 18;
                var min = max - 100;
                i =min;
                for( i=min;i<=max;i++){
                    cats.years.push(i);
                }
                
                

                return cats;

            }]);
