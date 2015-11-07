class HangpersonGame


  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  attr_accessor :word, :guesses, :wrong_guesses, :count

  def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
    @count = 0
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri, {}).body
  end

  def guess(your_guess)
    @guesses = your_guess
    unless valid
      @wrong_guesses << your_guess
      @count += 1
    end
  end

  def valid
    raise Exception, "Wrong guess" unless @word.include? @guesses.to_s
     true
  end


end

