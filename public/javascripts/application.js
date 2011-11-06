// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var next = function(event) {
  if ($(event.target).hasClass('clicked'))
    return;
  $(event.target).addClass('clicked');
  var box = $('#wrapp_box>ul>li').last();
  var dload = $('<div class="loading"></div>');
  dload.height(box.height());
  dload.width(box.width());
  box.append(dload);
  var dload2 = 0;
  if (box.prev()) {
    dload2 = $('<div class="loading"></div>');
    dload2.height(box.prev().height());
    dload2.width(box.prev().width());
    box.prev().append(dload2);
  }
  window.location.hash = "#!" + this
  $.ajax({
    url: this,
     success: function(data) {
        dload.remove();
        if (dload2 != 0)
          dload2.remove();
        var prevBox = $('#wrapp_box>ul>li').last();
        
        var newLi = $('<li class="box">' + data + '</li>');
        $('#wrapp_box>ul').append(newLi);
        $(newLi).find('.suggestions').find('a').click(next);
        $(newLi).find('.back_button').find('a').click(back);
        var marginValue = $('#wrapp_box>ul .box').width() + 32 - parseInt($('#wrapp_box>ul').css('margin-left').replace('px', ''));
        $('.box').height($(prevBox).height());
        $('.spacer').height($(prevBox).height());
        $('#wrapp_box>ul').animate({marginLeft: -marginValue}, {duration: 800});
        chat_load();

        prevBox.addClass('prev_box');

//        $('.suggestions li a').click(next);
        $('.box').width($('#wrapp_box').width() * 0.6);
     }
    });
        
  return false;
}

var back = function() {
        var marginValue =  parseInt($('#wrapp_box>ul').css('margin-left').replace('px', '')) + $('#wrapp_box>ul .box').width() + 32;

        $('#wrapp_box>ul').animate({marginLeft: marginValue}, {duration: 800, complete: function() {
          $('#wrapp_box>ul>li').last().remove();
        }});
          var prevBox = $('#wrapp_box>ul>li').last().prev();
          $(prevBox).find('a').each(function(i, e) {
            $(e).removeClass('clicked');
          })
          prevBox.removeClass('prev_box');
}

var initWindow = function() {
  $('.suggestions li a').unbind('click');
  $('.suggestions li a').click(next);
  $('.back_button a').unbind('click');
  $('.back_button a').click(back);
  $('.box').width($('#wrapp_box').width() * 0.6);
//  $('.box').width(400);
//  var ml = $('#wrapp_box').width() - $('.box').width() - 32;
//  $('#wrapp_box>ul').css({marginLeft: ml});
//  $('.suggestions').height($('.box').height() * 0.7);
}

$(document).ready(function(){
  initWindow();
})

$(window).resize(initWindow);
