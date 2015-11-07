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

  def guess(letter)

    if @word.include? letter
      @guesses << letter
      true
    else
      @count += 1
      @wrong_guesses += letter
      # raise Exception,

      false
    end
    begin
      check_win_lose @count
    rescue Exception, "Wrong letter. #{:play}"
      "Play again"
    end

  end

  def check_win_lose(counts)
    if counts == 7
      :lose
    elsif counts < 7
      raise Exception, "Wrong letter"
      # return :play
    else
      :win
    end
  end


  def word_with_guesses
    "You won!" if @guesses == @word
  end

end

