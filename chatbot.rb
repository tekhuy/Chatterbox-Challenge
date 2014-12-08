require 'colorize'
require './responses.rb'

def get_response(input)

if input == "quit"
  exit
else
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? get_schooled(input) : response % { c1: $1, c2: $2, c3: $3}
end
end

def get_schooled(input)
  print "what would you like me to learn?"
  teach = gets.chomp || RESPONSES
  learn(teach, input)
end

def learn(input, teach)
  RESPONSES[teach] = input
end


@bot = 'bot: '.red
@human = 'human: '.green
puts @bot + "Hello, what's your name?"
print @human
name = gets.chomp
puts @bot + "Hello #{name}"
print @human
while(input = gets.chomp) do
  print @bot
  puts get_response(input)
  print @human
end
