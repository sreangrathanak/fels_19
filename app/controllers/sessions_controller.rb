class SessionsController < ApplicationController
  #action new
  def new
  end
  #action create
  def create 
  	#declare user variable which init from the find of User in users table by their email
  	#Which the mail is get from user fill form and convert it to downcase before find
  	user=User.find_by(email: params[:session][:email].downcase)
  	#if we can find user by the email now we check the password if they are match 
  	if user && user.authenticate(params[:session][:password])
  		#call the methos log_in which locate at app/helper/sessions_helper that we use to store the user id
  		log_in user
  		#user params to get all data that user input and fitter to get  only remember_me and than compare if user check on remember me or not
  		#if user check call the method remember which locate at app/helper/sessions_helper which function is used to store remember token
  		#or else if not check call the method forget which locate at app/helper/sessions_helper which function is used to remove remember token
  		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		#params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		#link to the user profile
  		redirect_to user
  	else #or else
  		#show the message of wrong login
  		flash[:danger]='Invalid email/password combination'
  	#load the new action
  	render 'new' 	
    end
  end
  #action destroy
  def destroy 
  	#call method log_out which locate at app/helper/session_helper to clear all before log out if user is logged in by call method logged_in to check and locate at app/helper/session_helper
  	log_out if logged_in?
  	#link to the root path after log out
  	redirect_to root_url 	
  end
end
