// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var next = function(event) {
  link = $(event.target).closest('a');
  if (link.parent().hasClass('chat-link'))
    link = link.parent().prev()
  if (link.hasClass('clicked'))
    return;
  link.addClass('clicked');
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
  window.location.hash = "#!" + link.attr('href');
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
	$('.searchbar input').focus(displayDropdown);
	$('.searchbar input').blur(hideDropdown);
	initSearch();
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

var dropdownClicked = function() {
//    alert($(this).html());
    var input = $('.searchbar').find('input[name=search]');
    input.val($(this).find('strong').text() + " ");
    input.trigger('focus');
    $('.dropdown').remove();
}

var displayDropdown = function(event) {
  if ($('.dropdown').length == 0)
  {
    var input = $(event.target);
    var dropdown = $('<div class="dropdown"><ul><li><strong>Like</strong> &lt;artist&gt;</li><li><strong>Rencently listened to</strong> &lt;track name&gt;</li></ul></div>');
    dropdown.width(input.width() + 6);
    $('.searchbar').append(dropdown);
    dropdown.css({top : input.height() + 10, left:5});
    dropdown.find('li').click(dropdownClicked);
    }
}

var hideDropdown = function(event) {
  try {
    if ($('.dropdown').last().is(':hover') == false)
      $('.dropdown').last().remove();
   } catch (e) {
      $('.dropdown').last().remove();
   }
}

var initWindow = function() {
  $('.suggestions li a').unbind('click');
  $('.suggestions li a').click(next);
  $('.back_button a').unbind('click');
  $('.back_button a').click(back);
  $('.box').width($('#wrapp_box').width() * 0.6);
  $('.searchbar input').focus(displayDropdown);
  $('.searchbar input').blur(hideDropdown);

//  $('.box').width(400);
//  var ml = $('#wrapp_box').width() - $('.box').width() - 32;
//  $('#wrapp_box>ul').css({marginLeft: ml});
//  $('.suggestions').height($('.box').height() * 0.7);
}

var initSearch = function() {
  forms = $('.searchbar form')
  forms.each(function(i, form) {
    input = $(form).find('input[name=search]');
    input.keypress(function() {
      input.removeClass('error');
    });
    $(form).unbind('submit');
    $(form).submit(function() {
      input.removeClass('error');
      last_url = $(form).find('input[name=last_url]').val();
      if (input.val().substring(0, 5) == "Like ")
      {
        arg = input.val().substr(5);
        $.ajax({
          url: '/search/fan/' + arg,
          data: {
            'last_url': last_url
          },
          success: function( data ) {
            $(form).parent().next().find('ul li').last().remove()
            $(form).parent().next().find('ul').prepend('<li>'+ data + '</li>');
            $(form).parent().next().find('ul li').first().find('a').click(next);
            hideDropdown();
          },
          error: function(error) {
            input.addClass('error');
          }
        });
      }
      else if (input.val().substring(0, 22) == "Rencently listened to ")
      {
        arg = input.val().substr(22);
        $.ajax({
          url: '/search/listened/' + arg,
          data: {
            'last_url': last_url
          },
          success: function( data ) {
            $(form).parent().next().find('ul li').last().remove()
            $(form).parent().next().find('ul').prepend('<li>'+ data + '</li>');
            $(form).parent().next().find('ul li').first().find('a').click(next);
            hideDropdown();
          },
          error: function(error) {
            input.addClass('error');
          }
        });
      }
      else
      {
        input.addClass('error');
      }
      return false;
    });
  });
}

$(document).ready(function(){
  initWindow();
  initSearch();
})

$(window).resize(initWindow);
