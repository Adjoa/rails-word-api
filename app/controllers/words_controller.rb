class WordsController < ApplicationController
  
  def random
    if params[:words].length >= 2
      word = params[:words].sample
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
