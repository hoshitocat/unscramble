class Unscramble
  DEFAULT_FILE_PATH = './words.txt'

  attr_accessor :file_path, :words, :input_text

  def initialize(filename=nil, input_text)
    @file_path = filename.nil? ? DEFAULT_FILE_PATH : "#{filename}"
    @words = []
    @input_text = input_text
  end

  def unscrambling
    prepare_unscramble
    @words.each do |word|
      return word if matching?(word)
    end
    'Sorry, no solution are possible.'
  end

  private

  def prepare_unscramble
    file = File.new(@file_path)
    @words = []
    file.each_line { |line| @words << line }
  end

  def matching?(word)
    return if word.nil?

    @input_text.split('').each do |alphabet|
      next if word.include?(alphabet)
      return false
    end
  end
end


while true
  puts 'Input random word:'
  print "> "
  text = STDIN.gets

  break if text.chomp! == "exit"

  unscramble = Unscramble.new(ARGV[0], text)
  puts unscramble.unscrambling
end
