class Category < ActiveRecord::Base
	#make has many relationship with Lesson
	has_many :lessons
	#make has many relationship with Word
    has_many :words	
end
