class StaticPagesController < ApplicationController

  def home  	
    if logged_in?  	 	
      @lesson  = current_user.lessons.build      
      @activity_lessons = current_user.activity.paginate(page: params[:page])
    end
  end

  def help
  	@static_page=StaticPage.first
  end

  def about
  	@static_page=StaticPage.first
  end

  def contact
  	@static_page=StaticPage.first
  end
end
