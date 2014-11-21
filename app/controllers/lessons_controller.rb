class LessonsController < ApplicationController

  def create	

    category=Category.find params[:category_id]	
    words = category.words.order("RAND()").limit 20	
    @lesson= Lesson.new(user_id:current_user.id,category_id:category.id)
    words.each do |word|
      @lesson.lesson_words.build word_id: word.id, word_answer_id: 0
    end
    if @lesson.save               
      redirect_to @lesson
    else
      flash[:danger]="Can not start the lesson!"
      redirect_to @lesson.category
    end    
  end
  
  def show

    @lesson=Lesson.find params[:id]

  end

  def update

    @lesson=Lesson.find params[:id]
    if @lesson.update_attributes lesson_params      
      @lesson.update_attributes result:@lesson.lesson_words.correct_answers.count      
      render "result"
    else
      render "show"
    end       
  end

  private 

  def lesson_params
    params.require(:lesson).permit :id, lesson_words_attributes: [:id, :word_answer_id]
  end
end
