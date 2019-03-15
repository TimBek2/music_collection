music_collection = {}

puts 'Welcome to your music collection!'
puts 'What would you like to do?'

command = gets.chomp

words = command.split

action = words.shift.downcase

puts "#{action}"
