// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require_tree .
/* global $*/
$(function() {
  $('#slider').slick({
      slidesToShow: 4, //表示するスライドの数
      slidesToScroll: 4, //スクロールで切り替わるスライドの数
  });
});

$(function() {
  $('#slider2').slick({
      slidesToShow: 5, //表示するスライドの数
      slidesToScroll: 5, //スクロールで切り替わるスライドの数
  });
});