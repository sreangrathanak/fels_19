class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  #belongs_to :word
  #belongs_to :word_answer
  #make has many relationship with Lesson
  has_many :word
  #make has many relationship with Lesson
  has_many :word_answer
end
