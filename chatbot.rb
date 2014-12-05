require 'colorize'

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
  print "what would you like me to learn?".green 
  teach = gets.chomp
  learn(teach, input)
end

def learn(input, teach)
  RESPONSES[teach] = input
end



RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
          	  'I like cake' => 'what type?',
          	  'What is your name?' => 'My name is Bot',
          	  'What language do you speak?' => 'I speak Ruby',
          	  'What do you like to do?' => 'I like to code',
          	  'You\'re not much fun are you?' => 'And you are?',
          	  'Do you play (.*)?' => 'I love to play %{c1}!',
          	  'I support (.*), I don\'t like (.*) or (.*)!' => 'Who are %{c1}? I like %{c2} but I don\'t like %{c3}',
			}

@bot = 'bot: '.red
@human = 'human: '.magenta
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