$(document).ready( function () {
  
  alert("Hello, world")
  
}); 

(function ($) {
  $(document).ready(function(){

    // hide .navbar first
    $(".navbar-scroll").hide();
    $(".navbar-noscroll").show();


    // fade in .navbar
    $(function () {
        $(window).scroll(function () {

                 // set distance user needs to scroll before we start fadeIn
            if ($(this).scrollTop() > 50) {
                $('.navbar-noscroll').fadeOut();
                $('.navbar-scroll').fadeIn();
            } else {
                $('.navbar-scroll').fadeOut();
                $('.navbar-noscroll').fadeIn();

            }
        });
    });

});
  }(jQuery));