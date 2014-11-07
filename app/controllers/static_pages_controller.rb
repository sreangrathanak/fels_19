class StaticPagesController < ApplicationController
  def home
  	#check if user is logged in
  	 if logged_in?
  	 	#if true
  	 	#get the lesson of current user
      @lesson  = current_user.lessons.build
      #get lesson activity of current user
      @activity_lessons = current_user.activity.paginate(page: params[:page])
    end
  end
  def help
  end
end
