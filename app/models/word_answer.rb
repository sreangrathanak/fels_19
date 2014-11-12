class WordAnswer < ActiveRecord::Base
  belongs_to :word  
  belongs_to :lesson_word
  scope :answer_correct ,->{
    WordAnswer.select(:id).where(correct: true)
  }
end
