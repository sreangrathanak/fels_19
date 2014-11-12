class Word < ActiveRecord::Base
  belongs_to :category  
  has_many :word_answer 
  def word_answers
    WordAnswer.where(word_id:id)
  end  
end
