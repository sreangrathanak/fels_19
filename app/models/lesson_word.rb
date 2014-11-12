class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  has_many :word
  has_many :word_answer  
  def word
    Word.find_by(id:word_id)
  end
  def word_answer
    WordAnswer.find_by(id:word_answer_id)
  end  
end
