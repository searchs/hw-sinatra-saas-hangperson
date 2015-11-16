class HangpersonGame


  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end

  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(new_word)
    if new_word.is_a?(String)
      @word = new_word.downcase
      @guesses = ''
      @wrong_guesses = ''
    else
      raise ArgumentError, 'Invalid guess word!'
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri, {}).body
  end

  def guess(l)
    # if !l.nil? and !l.empty? or l.is_a? String and l =~ /[a-zA-Z]/ and l != ''
    # if !l.nil? and !l.empty? or l.is_a? String and l =~ /([a-zA-Z])/
    # if l.is_a? String and l =~ /([a-zA-Z])/ and l != '' and l =~ /[^0-9_]/
    # if l.is_a? String and l =~ /([a-zA-Z])/ and l != '' and l =~ /[^0-9\W\s]/
    # if l =~ /([a-zA-Z])/ and l =~ /[^0-9\W\s]/ and !l.nil?
    letter = l.to_s.downcase
    if l =~ /([a-zA-Z])/ or l =~ /[^\d\w\s\W]/ and !l.nil?
      # if l =~ /\A[\sa-z0-9]+\Z/i and !l.nil?
      # if !l.nil?
      # letter = l.delete('').to_s.downcase
      # if l == '' or l =~ /[^a-zA-Z]/ or l.empty?
      #   status = false
      # else

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
      #  l =~ /([^a-zA-Z])/ or l.to_s[0] == ''
      # elsif l.is_a? String and  l =~ /([^a-zA-Z])/
      #   status = false
    else
      raise ArgumentError, 'Invalid guess. Enter a valid letter.'
    end
    status
  end

  def check_win_or_lose
    return :win if word_with_guesses == @word
    return :lose if @wrong_guesses.size == 7
    :play
  end

  def word_with_guesses
    return self.word.gsub(/([^#{self.guesses}])/, '-') if self.guesses.size > 0
    return "-" * self.word.size
  end

end
