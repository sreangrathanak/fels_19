class CategoriesController < ApplicationController
before_action :logged_in_user, only:[:index, :edit, :update,:destroy]
def index  
  @categories=Category.all  	
end
def show		 		
  @category=Category.find params[:id]			
  @words=@category.words.order(:id)		
  if params[:word].nil?			
    @word= @words.order("RAND()").last
  else						
	@word= @words.order("RAND()").first	
  end			
	@word_answers=WordAnswer.where(word_id:@word.id)
  end
end
