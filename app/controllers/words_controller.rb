class WordsController < ApplicationController
  
  ##
  # Returns a randomly selected word from an array of words
  def random
    if params[:words].length >= 2
      word = params[:words].sample
      json_response({random_selection: word}, :ok)
    else
      json_response({ message: 'Two words must be submitted to make a selection' }, :unprocessable_entity)
    end
  end
  
  ##
  # Returns an array of words that rhyme with the submitted word
  def rhyming
    if !params[:word].empty?
      rhymes = Rhymes.new
      
      begin  
        rhyming_words = rhymes.rhyme(params[:word])
      rescue StandardError => e  
        json_response({ err: e }, :not_found)
      else
        json_response({rhyming_words: rhyming_words}, :ok)
      end
    else
      json_response({ message: 'Sorry, we couldn\'t process your submission' }, :unprocessable_entity)
    end
  end
  
  ##
  # Returns the reversed equivalent of the submitted word
  def reverse
    if !params[:word].empty?
      reversed_word = params[:word].reverse
      json_response({ reversed_word: reversed_word }, :ok)
    else
      json_response({ message: 'Sorry, we couldn\'t process your submission' }, :unprocessable_entity)
    end
  end
end
