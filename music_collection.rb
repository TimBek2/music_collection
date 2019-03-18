require 'pry'

music_collection = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }

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

  title = info.slice!((quote_indices[0])..quote_indices[1]).delete_prefix('"').delete_suffix('"')
  artist = info.strip.delete_prefix('"').delete_suffix('"')

  music_collection[artist][title] = false

  binding.pry
end
