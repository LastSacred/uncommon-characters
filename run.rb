require "pry"
require "./uncommon_character_finder.rb"
require "./values.rb"

binding.pry
puts UncommonCharacterFinder.new(INPUT).results == EXPECTED_OUTPUT