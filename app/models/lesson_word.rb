class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  has_many :word
  has_many :word_answer  
end
