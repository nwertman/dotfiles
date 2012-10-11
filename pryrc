require 'rubygems'

require 'pry-doc'

Pry.config.editor = 'vim'

def time_method(method=nil, *args)
  beginning_time = Time.now
  if block_given?
    yield
  else
    self.send(method, args)
  end
  end_time = Time.now
  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
end

# Add !<history>
Pry.commands.block_command(/!(\d+)/, "Replay a line of history", :listing => "!hist") do |line|
  run "history --replay #{line}"
end

#
# Load in confidential work stuff
load File.expand_path("~/.pryrc_work")
