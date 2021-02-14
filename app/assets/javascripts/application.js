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
//= require_tree .


/* global $*/
$(document).on('turbolinks:load',function(){
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
});

$(function(){
  let tabs = $(".tab");
  $(".tab").on("click", function() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".content").removeClass("show").eq(index).addClass("show");
  })
})

$(document).on('turbolinks:load',function(){
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

  if($("#formTagInput_tag").length){
    $('#formTagInput_tag').data('ui-autocomplete')._renderItem = function(ul, item) {
      return $('<li class="w-100">').data('item.autocomplete', item).append('<a class="w-100 d-flex">' + item.name + '</a>')
        .appendTo(ul);
    }
  }

});