// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require slick


import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require slick


function initializeSlider() {
  $('.slider:not(.slick-initialized)').slick({
    autoplay: true,
    autoplaySpeed: 3000,
    arrows: true,
    dots: false,
    prevArrow: '<button type="button" class="prev"> << </button>',
    nextArrow: '<button type="button" class="next"> >> </button>'
  });
}

function initializePopup() {
  $('body').on('click', '.popup-btn', function() {
    $(this).siblings('.popup').fadeIn();
  });

  $('body').on('click', '.popup', function(e) {
    if (e.target == this) {
      $(this).fadeOut();
    }
  });
}

function initialize() {
  initializeSlider();
  initializePopup();
}


document.addEventListener("turbo:load", function() {
  initialize();
});

// $(document).on('turbolinks:load', function () {

//   initialize();
// });


// $(document).ready(function() {
//   $('.slider').slick({
//     autoplay: true,
//     autoplaySpeed: 3000,
//     arrows: true,
//     dots: false,
//     prevArrow: '<button type="button" class="prev"> << </button>',
//     nextArrow: '<button type="button" class="next"> >> </button>'
//   });
// });


// $(document).ready(function() {
//   $('.popup-btn').click(function() {
//     $(this).siblings('.popup').fadeIn();
//   });

//   $('.popup').click(function(e) {
//     if (e.target == this) {
//       $(this).fadeOut();
//     }
//   });
// });




    