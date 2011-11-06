// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var next = function(event) {
  $.ajax({
    url: this,
     success: function(data) {
        var prevBox = $('#wrapp_box>ul>li').last();
        $('#wrapp_box>ul').append($('<li class="box">' + data + '</li>'));
        var marginValue = $('#wrapp_box>ul .box').width() + 32 - parseInt($('#wrapp_box>ul').css('margin-left').replace('px', ''));
        $('#wrapp_box>ul').animate({marginLeft: -marginValue});
        prevBox.addClass('prev_box');
        initWindow();
        $(event.target).addClass('clicked');
     }
    });
  return false;
}

var initWindow = function() {
  $('.suggestions li a').click(next);
  $('.box').height($(document).height() * 0.8);
  $('.box').width($('#wrapp_box').width() * 0.66);
  var ml = $('#wrapp_box').width() - $('.box').width() - 32;
  $('#wrapp_box>ul').css({marginLeft: ml});
  $('.suggestions').height($('.box').height() * 0.7);
}

$(document).ready(function(){
  initWindow();
})

$(window).resize(initWindow);
