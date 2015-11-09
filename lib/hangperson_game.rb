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
    if !letter.nil? or !letter.empty? or letter.size == 1 or letter.is_a? String
      if @word.include? letter
        if @guesses.include? letter
          return true
        else
        @guesses << letter
        true
        end
    else
     if @wrong_guesses.include? letter
       "Wrong Guess. Another try?"
       false
     else
     @count += 1
      @wrong_guesses << letter
      p @wrong_guesses
    end
    end
  else
    raise ArgumentError, "Invalid entry.  Enter a valid letter."
  end
end

def check_win_or_lose
  if @counts == 7
    :lose
  elsif @counts < 7
    return :play
  else
    @word == @guesses
    :win
  end
end


def word_with_guesses
  "You won!" if @guesses == @word
end

end
