(function( $ ) {
	'use strict';

	/**
	 * All of the code for your admin-facing JavaScript source
	 * should reside in this file.
	 *
	 * Note: It has been assumed you will write jQuery code here, so the
	 * $ function reference has been prepared for usage within the scope
	 * of this function.
	 *
	 * This enables you to define handlers, for when the DOM is ready:
	 *
	 * $(function() {
	 *
	 * });
	 *
	 * When the window is loaded:
	 *
	 * $( window ).load(function() {
	 *
	 * });
	 *
	 * ...and/or other possibilities.
	 *
	 * Ideally, it is not considered best practise to attach more than a
	 * single DOM-ready or window-load handler for a particular page.
	 * Although scripts in the WordPress core, Plugins and Themes may be
	 * practising this, we should strive to set a better example in our own work.
	 */

	 jQuery(document).ready(function(){
  
  
		let scroll_to_top = ".scroll-to-top";
	  
		jQuery(window).bind('scroll', function() {
	  
		  let myheader = localize_my_header_script.my_header;
		  let onscroll = localize_my_header_script.scroll;
		  let bg_head_clr = localize_my_header_script.bg_head_clr; 
		  let scrolltopvalue = localize_my_header_script.scroll_to_top;
	  
		  if(jQuery(window).scrollTop() > onscroll) {
	  		    jQuery(myheader).addClass('sticky');
			  	jQuery(".sticky").css("background-color", bg_head_clr);
	  			jQuery(scroll_to_top).show();
		 	 }
		  else {
				jQuery(myheader).removeClass('sticky');
				jQuery(myheader).removeAttr("style");
				jQuery(scroll_to_top).hide();
		 	 }
	  
		  if (scrolltopvalue != "checked"){
			jQuery(scroll_to_top).hide();
		  }
		  
	  
		  
		})
	  
		  /*
		  ajax submit id or class
		  */
		  jQuery('#add-sticky-header').submit(function(){
		
		  let insertintodbajax = stickyheaderajaxurl.ajaxurl;

		  let links_data = "action=addstickyheaderid&parameter=add_sticky_header_id&" + jQuery('#add-sticky-header').serialize();
		  jQuery.post(insertintodbajax, links_data, function(response){
					let success_msg = jQuery.parseJSON(response);
					if(success_msg.status == 1 ){
					  
						let myheader = success_msg.my_header;
	  
					//	let bg_head_clr = success_msg.bg_head_clr;
	  
					//	let onscroll = success_msg.scroll_to_top;
	  
						console.log(myheader);
	  
						
						$("#show-success-msg").append(" <b>Changes Updated Successfully</b>").fadeOut(3000);
					  }
				});
		  })
	  
	  
	  });
	  
	  
	  

})( jQuery );
