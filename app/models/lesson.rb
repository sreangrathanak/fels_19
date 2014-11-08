class Lesson < ActiveRecord::Base
  #make has many relationship with Lesson_word
  has_many :lesson_words  
  #make ralationship with user
  belongs_to :user
  #make ralationship with category
  belongs_to :category
  #make sure user id is valied
  validates :user_id, presence: true
  #make sure category id is valied
  validates :category_id, presence: true
  #validates :result, presence: true
end
