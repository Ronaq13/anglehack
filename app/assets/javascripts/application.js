// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require typed
//= require turbolinks
//= require materialize-sprockets
//= require_tree .



// for changing navbar
$(window).scroll(function() {
    var scrollPos = $(document).scrollTop();

    if (scrollPos <= 20) {
        $("#myNav").removeClass("navbarAtScroll").addClass("navbarAtTop");
    } else {
        $("#myNav").addClass("navbarAtScroll").removeClass("navbarAtTop");
    }
});

$(document).ready(function(){
    $('.parallax').parallax();
});

$(document).ready(function(){


    $("#typed-data").typed({
        strings: ["Bookmics.., a way to take your book along", "Love of readers", "Come and join us...,"],
        typeSpeed: 0,
        loop: true
    });


    // Initialize collapse button
    $(".button-collapse").sideNav();
    // Initialize collapsible (uncomment the line below if you use the dropdown variation)
    //$('.collapsible').collapsible();

    $('.button-collapse').sideNav({
            menuWidth: 300, // Default is 300
            edge: 'right', // Choose the horizontal origin
            closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
            draggable: true // Choose whether you can drag to open on touch screens
        }
    );



});


