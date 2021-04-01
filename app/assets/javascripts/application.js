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
//= require turbolinks
//= require jquery-ui.min
//= require jquery.tagsinput.min
//= require chartkick
//= require Chart.bundle
//= require_tree .


/* global $*/
$(document).on('turbolinks:load',function(){
$(function() {
  $('#slider').slick({
      slidesToShow: 4, //表示するスライドの数
      slidesToScroll: 4, //スクロールで切り替わるスライドの数
      responsive: [{
        breakpoint: 640, //画面幅768pxで以下のセッティング
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
        }
      }]
  });
});
});

$(document).on('turbolinks:load',function(){
$(function() {
  $('#slider2').slick({
      slidesToShow: 5, //表示するスライドの数
      slidesToScroll: 5, //スクロールで切り替わるスライドの数
      responsive: [{
        breakpoint: 640, //画面幅768pxで以下のセッティング
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
        }
      }]
  });
});
});

// ヘッダー黒くする
// $(document).on('turbolinks:load',function() {
//   if (location.pathname == "/" ){
//   $(window).scroll(function() {
//   console.log(location.pathname)
//     if ($(window).scrollTop() > 600) {
//       $('.main_h').removeClass('not_show');
//     }
//     if ($(window).scrollTop() < 600) {
//       $('.main_h').addClass('not_show');
//     }
//   });
//   }
// });


$(document).on('turbolinks:load',function() {
  var tabs = $(".tab");
  $(".tab").on("click", function() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".content").removeClass("show").eq(index).addClass("show");
  })
});

// location.searchで分岐
// $(function(){
//   var tabs = $(".tab2");
//   $(".tab2").on("click", function() {
//     $(".active2").removeClass("active2");
//     $(this).addClass("active2");
//   })
// });

$(document).on('turbolinks:load',function(){
  if($("#formTagInput").length){
  $('#formTagInput').tagsInput({
    'autocomplete_url': "/tags/autocomplete.json",
    'autocomplete': {
      focus: function(event, ui){
        $('#formTagInput_tag').val(ui.item.name);
        return false;
      },
      select: function(event, ui) {
        $('#formTagInput').addTag(ui.item.name);
        return false;
      }
    },
    'height:': 'calc(2.25rem + 2px)',
    'width': '100%',
    'defaultText': ''
  })
  }
  if($("#formTagInput_tag").length){
    $('#formTagInput_tag').data('ui-autocomplete')._renderItem = function(ul, item) {
      return $('<li class="w-100">').data('item.autocomplete', item).append('<a class="w-100 d-flex">' + item.name + '</a>')
        .appendTo(ul);
    }
  }
});

