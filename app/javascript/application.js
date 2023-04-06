// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require slick

$(document).ready(function() {
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: true,
    dots: false,
    prevArrow: '<button type="button" class="prev"> << </button>',
    nextArrow: '<button type="button" class="next"> >> </button>'
  });
});


$(document).ready(function() {
  $('.popup-btn').click(function() {
    $(this).siblings('.popup').fadeIn();
  });

  $('.popup').click(function(e) {
    if (e.target == this) {
      $(this).fadeOut();
    }
  });
});


    