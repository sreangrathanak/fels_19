class CategoriesController < ApplicationController
#the looged_in_user in locate at ApplicationHelper
#user methods before_action to check that user is logged in or not before they can view, edit, update or delete user profile
  before_action :logged_in_user, only:[:index, :edit, :update,:destroy]
  def index
  	#decleare lesson with data of lesson  	  	
  	@categories=Category.all
  	#@lessons=Lesson.all
  end
  def show		 
		#get category of lesson
		@category=Category.find params[:id]	
		#get word in each category
		@words=@category.words.order(:id)

		#generate with random word in the category # this for temperary only
		if params[:word].nil?
			#create
			#@word= @words.first   
			@word= @words.order("RAND()").last
		else			
			#@words.order(:id).each{|tem_word|
			#	if tem_word.id > params[:word]
			#		@word=tem_word
			#	end
			#}	
			@word= @words.order("RAND()").first	
		end	
		#@word= @words.order("RAND()").first
		#get all 4 word answers
		@word_answers=WordAnswer.where(word_id:@word.id)
  end
end
