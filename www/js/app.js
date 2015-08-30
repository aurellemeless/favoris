jQuery(document).ready(function($) {

	//FLEXSLIDER

	$(window).load(function() {
	 /* best seller */
	  $('.flexslider').flexslider({
	  	pauseOnHover: true,
		controlNav: true,
		directionNav: true,
		slideshow: true,
		animationSpeed: 2000,
		animation: 'slide',
		animationLoop: true,
	    itemWidth: 180,
	    itemMargin: 0,
	    minItems: 1,
	    maxItems: 4
	  });


	  
	  /* partenaire */
	   $('.partnerslider').flexslider({
		controlNav: true,
		directionNav: true,
		animationSpeed: 1000,
		animation: 'slide',
		animationLoop: true,
	    itemWidth: 160,
	    itemMargin: 0,
	    minItems: 2,
	    maxItems: 4
	  });



	  /* produit slider*/
	   $('.produitslider').flexslider({
		controlNav: false,
		directionNav: true,
		animationSpeed: 2000,
		animation: 'slide',
		animationLoop: true,
	    itemWidth: 120,
	    itemMargin: 0,
	    minItems: 1,
	    maxItems: 3
	  });


	});


	

});