class UncommonCharacterFinder
  attr_accessor :input, :test_cases, :uncommon_characters, :results

  def initialize(input)
    self.input = input
    parse_test_cases
    find_uncommon_characters
    self.results = format_results
  end

  private

  def parse_test_cases
    input_array = input.split("\n")
    input_array.shift
    test_cases = []

    while input_array.count > 0
      test_cases << input_array.shift(2).map { |word| word.split("") }
    end

    self.test_cases = test_cases
  end

  def format_results
    uncommon_characters.map(&:join).join("\n")
  end
  
  def find_uncommon_characters
    self.uncommon_characters = test_cases.map do |test_case|
      characters = {}
      test_case.each_with_index do |word, index|
        word.each do |character|
          next characters[character] = index unless characters[character]
          characters[character] = "common" unless characters[character] == index
        end
      end 

      # complexity: n(n - x) = n^2
      # test_case_uncommon_characters = []
      # characters.each do |character, status|
      #   next if status == "common"

      #   insert_index = 0
      #   test_case_uncommon_characters.each do |uncommon_character|
      #     next insert_index += 1 if character > uncommon_character
      #     break
      #   end

      #   test_case_uncommon_characters.insert(insert_index, character)
      # end

      # test_case_uncommon_characters

      # complexity: n + (n - x) + (n - x)^2 = n^2
      # even though the first solution may be slightly more performant I think I would chose this since it is close in performance and much more readable
      characters.select { |character, status| status != "common"}.keys.sort
    end
  end
end