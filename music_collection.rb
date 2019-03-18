require 'pry'

class Song
  attr_reader :name, :artist, :played
end

music_collection = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }

puts 'Welcome to your music collection!'
puts 'What would you like to do?'

until (command = gets.chomp) == 'quit'
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

    puts 'Please wrap the song and artist in double-quotes (")' unless quote_indices.length == 4

    title = info.slice!((quote_indices[0])..quote_indices[1]).delete_prefix('"').delete_suffix('"')
    artist = info.strip.delete_prefix('"').delete_suffix('"')

    music_collection[artist][title] = false

    puts "Added \"#{title}\" by #{artist}"

  when 'show'
    secondary_action = words.shift.downcase

    if secondary_action == 'all'
      puts "You haven't added any songs yet!" if music_collection.empty?

      music_collection.each do |artist, song|
        song.each do |title, played|
          puts "\"#{title}\" by #{artist} #{ played ? 'played' : 'unplayed' }"
        end
      end
    end

  when 'play'
    title = words.join(' ').delete_prefix('"').delete_suffix('"')
    music_collection.each do |artist, songs|
      if songs.has_key? title
        music_collection[artist][title] = true
        puts "You're listening to \"#{title}\""
      else
        "You haven't added that song!"
      end
    end

  # close case statement
  end
end

puts 'Goodbye!'
