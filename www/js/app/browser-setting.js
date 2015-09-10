/* 
 */

//function to fix height of iframe!
var calcHeight = function() {
    var headerDimensions = $('.browser-header').height();
      $('.browser-frame').height($(window).height() - headerDimensions);
    };
    
$(document).ready(function() {
  calcHeight();
});

$(window).resize(function() {
        calcHeight();
    }).load(function() {
      calcHeight();
    });