class WordAnswer < ActiveRecord::Base
  belongs_to :word  
  belongs_to :lesson_word

  scope :correct ,->{
    WordAnswer.find_by correct: true
  }  
end
