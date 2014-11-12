class LessonsController < ApplicationController
  def new	
	@category=Category.find params[:category_id]	
	@words = @category.words.order("RAND()").limit 20	
  @lesson=create_lesson
  create_lesson_word 	
  redirect_to @lesson
  end
  def show
  	@lesson=Lesson.find params[:id]
  end
  def update
    @lesson=Lesson.find params[:id]
    update_lesson_word     
    render "result"
  end
  private
  def create_lesson
    Lesson.create! user_id:current_user.id,category_id:@category.id
  end
  def create_lesson_word 
    @words.each do |word|
      LessonWord.create! lesson_id:@lesson.id,word_id:word.id
    end
  end
  def update_lesson_word
    result=0
    @lesson.lesson_words.each do |lesson_word|
      lesson_word.update word_answer_id:params[:"#{lesson_word.word.id}"]
      if lesson_word.word_answer.correct
        result +=1
      end
    end
    update_lesson result
  end
  def update_lesson result
    @lesson.update result:result
  end
end
