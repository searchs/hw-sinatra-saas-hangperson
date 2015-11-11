class HangpersonGame


  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(new_word)
    if !new_word.nil? or !new_word.empty? and new_word.is_a?(String)
      @word = new_word.downcase
      @guesses = ''
      @wrong_guesses = ''
    else
      raise ArgumentError, 'Invalid word!'
    end

  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri, {}).body
  end

  def guess(l)
    if !l.nil? and !l.empty? or l.is_a? String and l =~ /[a-zA-Z]/ and l != ''
      letter = l.delete('').to_s.downcase
      if self.wrong_guesses.include?(letter)
        status = false
      elsif self.guesses.include?(letter)
        status = false
      else
        if self.word.include?(letter)
          self.guesses << letter
          status = true
        else
          self.wrong_guesses << letter
          status = true
        end
      end
    else
      raise ArgumentError, 'Invalid guess. Enter a valid letter.'
    end
    status
  end


  def check_win_or_lose
  # state = self.word =~ /([#{self.guesses}])/
    wl = self.word.chars
    gl = self.guesses.chars
    df = wl - gl
    if self.wrong_guesses.size == 7
      :lose
    elsif df.size == 0
      p df
      :win
    else
      :play
    end
  end

  def word_with_guesses
    if self.guesses.size == 0
      gl = self.wrong_guesses
    else
      gl = self.guesses
    end
    self.word.gsub(/([^#{gl}])/, '-')
  end

end