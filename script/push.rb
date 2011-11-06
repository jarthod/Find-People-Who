require 'rubygems'
require 'em-websocket'

@channels = {}

EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
  ws.onopen do
    puts ws.request['query'].inspect
    chan = 1

    # Create or fetch channel
    channel = (@channels[chan] ||= EM::Channel.new)
    puts "new client #{ws}"

    # Handle new client
    sid = channel.subscribe do |msg|
      puts "send to #{ws}: #{msg}"
      ws.send msg
    end

    # Send messages to all clients
    ws.onmessage do |msg|
      channel.push msg
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