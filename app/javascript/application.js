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
  $('body').on('click', '.popup-btn', function() {
    $(this).siblings('.popup').fadeIn();
  });

  $('body').on('click', '.popup', function(e) {
    if (e.target == this) {
      $(this).fadeOut();
    }
  });
}

function initializeCommuniquePopup() {
  $('body').on('click', '.communiquepopup-btn', function() {
    $(this).siblings('.communiquepopup-btn').fadeIn();
  });

  $('body').on('click', '.communiquepopup-btn', function(e) {
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


document.addEventListener("turbo:load", function() {
  initialize();
  
  document.getElementById("dropbtn").addEventListener('click', () => {

    var dropdownContent = document.getElementById("dropdown-content");
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  })

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
  
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      events: '/events.json'
    });
  
    calendar.render();
  });
  

});


    