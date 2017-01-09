$(document).ready(function() {
  // fade in first section
  $('#banner').fadeIn(3000);

  // sticky navbar
  $(window).bind('scroll', function() {
    var navHeight = $(window).height() - 60;
    if ( $(window).scrollTop() > navHeight ) {
      $('nav').addClass('nav-fixed');
    } else {
      $('nav').removeClass('nav-fixed');
    }
  });

  // smooth scroll headline arrow or about link to about section
  $('#headline-arrow, #about-link').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({ scrollTop: $('#about').offset().top - 60 }, 1500);
  });
  // smooth scroll to projects section
  $('#projects-link').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({ scrollTop: $('#projects').offset().top - 60 }, 1500);
  });
  // smooth scroll to contact section
  $('#contact-link').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({ scrollTop: $('#contact').offset().top - 60 }, 1500);
  });
  // smooth scroll footer arrow or home link back to top
  $('#footer-arrow, #home-link').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({ scrollTop: $('#home').offset().top - 60 }, 1500);
  });

});
