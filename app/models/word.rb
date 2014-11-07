class Word < ActiveRecord::Base
  belongs_to :category
  #make has many relationship with word answer
  has_many :word_answer
end
