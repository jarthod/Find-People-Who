// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var next = function() {
  $.ajax({
    url: this,
     success: function(data) {
        $('#wrapp_box>ul').append($('<li class="box">' + data + '</li>'));
        var marginValue = $('#wrapp_box>ul .box').width() +30 - parseInt($('#wrapp_box>ul').css('margin-left').replace('px', ''));
//        alert(marginValue); 
        $('#wrapp_box>ul').animate({marginLeft: -marginValue})
     }
    });
  return false;
}

$(document).ready(function(){
  $('ul#suggestions li a').click(next);
})