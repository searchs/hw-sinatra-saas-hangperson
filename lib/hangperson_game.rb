class HangpersonGame


  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(new_word)
    if !new_word.nil? and !new_word.empty? and new_word.class == String
      word = new_word.downcase
      @word = word
      @guesses = ''
      @wrong_guesses = ''
    else
      raise ArgumentError, "Invalid word for game!"
    end

  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri, {}).body
  end


  def guess(l)
    letter = l.downcase
    if !letter.nil? and !letter.empty? and letter.size == 1 and letter.is_a? String
      valid = self.word.include? letter
      if valid
        self.guesses << letter unless self.guesses.include? letter
      else
        self.wrong_guesses << letter unless self.wrong_guesses.include? letter
        "Wrong Guess. Another try?"
        # false
      end
      valid
    else
      raise ArgumentError, "Invalid entry.  Enter a valid letter."
    end
  end

  def self.check_win_or_lose
    # word_with_guesses
    if @wrong_guesses.size == 7
      'You lose code :lose'
    elsif @wrong_guesses.size < 7 and
        return :play
    else
      @word == @guesses
      :win
    end
  end


  def word_with_guesses
    gl = @guesses.split("")
    wl = @word.split("")
    gl.sort!.uniq
    p gl

    # "You won!" if @guesses == @word
  end

end
