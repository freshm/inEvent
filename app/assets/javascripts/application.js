// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap/js/alert.js
//= require bootstrap/js/modal.js
//= require bootstrap/js/dropdown.js
//= require bootstrap/js/collapse.js
//= require angular/angular.min.js

$(document).ready(function () {
  var test = $('#nutzb').on('click', function () {
    $('#myModal').modal()
  });

  $("#mark").on("click", function () {
    $.ajax({
      type: 'POST',
      data: {
        "current_user": current_user_id,
        "event": event_id
      },
      url: '/events/mark',
      dataType: "JSON"
    }).success(function (data) {
      console.log(data);
      renderAlertBox("Event vorgemerkt!")
    })
      .error(function (data) {
        console.log(data);
        renderAlertBox("Event bereits vorgemerkt!", "black", "alert-warning");
      });
  });

  $("#participate").on("click", function () {
    $.ajax({
      type: 'POST',
      data: {
        "current_user": current_user_id,
        "event": event_id
      },
      url: '/events/participate',
      dataType: "JSON"
    }).success(function (data) {
      console.log(data);
      renderAlertBox("Am Event teilgenommen!")
    })
      .error(function (data) {
        console.log(data);
        renderAlertBox("Am Event bereits teilgenommen!", "black", "alert-warning");
      })
  });

  $("#send-message").on('click', function (e) {
    e.preventDefault();
    alert("Noch nicht verfügbar")
  });

  $(".ie-lock").on('click', function () {
    console.log($(this));
    if ($(this).children().hasClass("fa-lock")) {
      $.ajax({
        type: 'POST',
        data: {
          "current_user": current_user_id,
          "field": $(this).children().attr('id')
        },
        url: '/user/privatise',
        dataType: "JSON"
      }).success(function (data) {
        console.log(data);
      })
        .error(function (data) {
          console.log(data);
        });
      console.log($(this).children().attr('id'));
      $(this).children().removeClass();
      $(this).children().addClass("fa fa-unlock");
    } else {
      $.ajax({
        type: 'POST',
        data: {
          "current_user": current_user_id,
          "field": $(this).children().attr('id')
        },
        url: '/user/privatise',
        dataType: "JSON"
      }).success(function (data) {
        console.log(data);
      })
        .error(function (data) {
          console.log(data);
        });
      console.log($(this).children().attr('id'));
      $(this).children().removeClass();
      $(this).children().addClass("fa fa-lock");
    }
  });


});

function renderAlertBox(text, color = "white", type = "alert-success") {
  var div = $("<div/>")
    .addClass("alert alert-box " + type)
    .append(
      $("<p/>")
      .addClass("center_text")
      .html(text)
      .css("color", color)
    )
  $("#top-navbar").append(div);

  setTimeout(function () {
    div.fadeOut(500);
  }, 2000);
}