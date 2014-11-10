class WordsController < ApplicationController
#the looged_in_user in locate at ApplicationHelper
#user methods before_action to check that user is logged in or not before they can view, edit, update or delete user profile
  before_action :logged_in_user, only:[:index, :edit, :update,:destroy]
	def index
		#get all word data
		@words=nil	
		@categories = Category.all
    	if params[:category_id]
      		@category = Category.find params[:category_id]	
      		@option=params[:condition]
      		case @option
      		when "learned"      			
      			#@words=             
      		when "notlearned"      			
      			#@words=
      		when "all"
      			@words=@category.words
      		end
      	end      
	end
end
