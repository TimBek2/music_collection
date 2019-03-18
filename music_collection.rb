require 'pry'

music_collection = {}

puts 'Welcome to your music collection!'
puts 'What would you like to do?'

command = gets.chomp

words = command.split

action = words.shift.downcase

# Iterate string to find indices of quotes
# command.each_index.select { |c| c == '"' }

# slice those quotes out to get song name(first set if present)
# artist(second set if present)


case action
when 'add'
  binding.pry
end

class Song
  attr_accessor :played
  attr_reader :name, :artist
end
