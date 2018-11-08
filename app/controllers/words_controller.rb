class WordsController < ApplicationController
  
  def random
    if !params[:word_1].empty? && !params[:word_2].empty?
      word = [params[:word_1], params[:word_2]].sample
      json_response({random_selection: word}, :ok)
    else
      json_response({ message: 'Two words must be submitted to make a selection' }, :not_found)
    end
  end
  
  # def rhyming
    
  # end
  
  # def reverse
    
  # end
end
