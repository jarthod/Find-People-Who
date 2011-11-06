var chat_load = function(url) {
  var command = $(".chat");
  var form = command.find("form");
  var field = form.find('input#message');
  var messages = $("ul.messages");
  if (messages.length)
  {
    var status = $("<div class=\"status sync\">Connecting to push server</div>");
    command.prepend(status);
    var timer;
    var Socket = "MozWebSocket" in window ? MozWebSocket : WebSocket;
    var ws = new Socket("ws://" + window.location.hostname + ":8080/");
    ws.onmessage = function(evt) { 
      status.text("Syncing...");
      status.addClass("sync");
      if (timer) {
        clearTimeout(timer);
        timer = null
      }
      timer = setTimeout(function() {
        status.removeClass("sync");
        var d = new Date;
        status.text("Synced at " + d.toLocaleTimeString());
      }, 2000)
      messages.append($("<li>" + evt.data + "</li>"));
    };
    ws.onopen = function() {
      status.text("Connected to push server");
      status.removeClass("sync");
    };
    ws.onclose = function(e) {
      status.text("Can't connect to push server");
      status.removeClass("sync")
      status.addClass("error")    
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
