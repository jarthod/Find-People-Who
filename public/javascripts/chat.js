var chat_load = function(url) {
  var command = $(".chat");
  var form = command.find("form");
  var field = form.find('input#message');
  var messages = $("ul.messages");
  if (messages.length)
  {
    var Socket = "MozWebSocket" in window ? MozWebSocket : WebSocket;
    var ws = new Socket("ws://" + window.location.hostname + ":8080/" + command.data("filters"));
    ws.onmessage = function(evt) { 
      messages.append($("<li>" + evt.data + "</li>"));
    };
    ws.onopen = function() {
    };
    ws.onclose = function(e) {
    }
    form.submit(function() {
      ws.send(field.val());
      field.val('');
      return false;
    });
  };
}

$(document).ready(function() {
    chat_load();
})
