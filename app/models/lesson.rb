class Lesson < ActiveRecord::Base  
  has_many :lesson_words    
  belongs_to :user  
  belongs_to :category  
  scope :lesson_order,-> { order('created_at DESC') }
  validates :user_id, presence: true  
  validates :category_id, presence: true
end
