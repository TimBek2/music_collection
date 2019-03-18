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
  info = words.join(' ')
  quote_indices = info.chars.each_index.select { |i| info[i] == '"'}

  p 'Please wrap the song and artist in double-quotes (")' unless quote_indices.length == 4

  song = info.slice!((quote_indices[0] + 1)...quote_indices[1])

  binding.pry
end

class Song
  attr_accessor :played
  attr_reader :name, :artist
end
