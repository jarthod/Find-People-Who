require 'rubygems'
require 'em-websocket'

@channels = {}
@users = []

EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
  ws.onopen do
    chan = ws.request['path']

    # Create or fetch channel
    channel = (@channels[chan] ||= EM::Channel.new)
    puts "new client #{ws.id}"
    @users << ws.id

    # Handle new client
    sid = channel.subscribe do |data|
      sender, msg = *data
      puts "send to #{ws.id}: #{msg}"
      if (sender == ws.id)
        ws.send "me: #{msg}"
      else
        ws.send "##{@user.index sender}: #{msg}"
      end
    end

    # Send messages to all clients
    ws.onmessage do |msg|
      channel.push [ws.id, msg]
    end

    # Remove from channel if disconnected
    ws.onclose do
      puts "onclose, unsubscribe #{ws}"
      channel.unsubscribe(sid)
    end
    
    # Display server-side errors
    ws.onerror do |e|
      puts "Error: #{e.message}"
    end
  end
end
