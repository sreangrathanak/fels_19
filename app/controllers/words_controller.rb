class WordsController < ApplicationController
  before_action :logged_in_user, only:[:index, :edit, :update,:destroy]
	def index		
		@words=nil	
		@categories = Category.all
    	if params[:category_id]
      	@category = Category.find params[:category_id]	
      	@option=params[:condition]
      	case @option
      	when "learned"      			
      			#Next Task
      	when "notlearned"      			
      			#Next Task
      	when "all"
      		@words=@category.words
      	end
      end      
	end
end
