// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"


//= require jquery
//= require slick

//= require @fullcalendar/core/main
//= require @fullcalendar/daygrid/main
//= require @fullcalendar/timegrid/main
//= require @fullcalendar/list/main



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
  $('body').on('click', '.popup-btn', function () {
    $(this).siblings('.popup').fadeIn();
  });

  $('body').on('click', '.popup', function (e) {
    if (e.target == this) {
      $(this).fadeOut();
    }
  });
}

function initializeCommuniquePopup() {
  $('body').on('click', '.communiquepopup-btn', function () {
    $(this).siblings('.communiquepopup-btn').fadeIn();
  });

  $('body').on('click', '.communiquepopup-btn', function (e) {
    if (e.target == this) {
      $(this).fadeOut();
    }
  });
}


function initialize() {
  initializeSlider();
  initializePopup();
  initializeCommuniquePopup();
}


document.addEventListener("turbo:load", function () {
  initialize();


  // const newMessageInput = document.getElementById("new_message");
  // if (newMessageInput) {
  //   newMessageInput.addEventListener("keypress", (e) => {
  //     if (e && e.keyCode === 13) {
  //       e.preventDefault();
  //       var form = e.target.form; // Get the parent form
  //       if (form) {
  //         form.submit()
  //       }    
  //     }
  //   });
  // }

  
  var newMessageFrame = document.getElementById("new_message_frame");
  if (newMessageFrame) {
    var newMessageForm = newMessageFrame.querySelector("form");
    if (newMessageForm) {
      newMessageForm.addEventListener("submit", function(e) {
        e.preventDefault(); // Prevent the default form submission
        var form = e.target;
        var formData = new FormData(form);

        Rails.ajax({
          type: form.method,
          url: form.action,
          data: formData,
          dataType: "script",
          success: function() {
            form.reset(); // Reset the form after successful submission
          }
        });
      });
    }
  }
 
  
});



