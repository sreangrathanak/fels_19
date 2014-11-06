module SessionsHelper
#Log in the given user. this methods is use as global in the whole App
def log_in(user)
	#assign the current user id into  hash session
	session[:user_id]=user.id
end
#define the methods to return the current user
def current_user
	#check if user_id=session[:user_id]
	if(user_id=session[:user_id])
		#if true 
		#this will return variable current_user if they not empty or else it will return the user which find by using id 
		@current_user ||=User.find_by(id:user_id)
	#else if user_id=cookies
	elsif (user_id= cookies.signed[:user_id])
		#if true
		#declare user virable to get user from user table by find follow the user_id
		user=User.find_by(id:user_id)
		#after that check if we can find the user or not
		#if we find the use let compare the user remember digest and cookied remember_token
		if user && user.authenicated?(cookies[:remember_token])
			#if match
			#call log in method
			log_in user
			#assign current user with the user
			@current_user=user
		end
	end	
end
#define function for check is user  have sign in or not
def logged_in?
	#return the boolean of current user , return true is have, false is not
	!current_user.nil?
end
#the methods will clear all data after user log out
def log_out
	#call themethod forget below
	forget current_user
	#delete user id data in session
	session.delete(:user_id)
	#make current user =empty
	@current_user=nil
end
#define the method for remember
def remember user
#run the method remember which locate at app/model/users
user.remember
#add the user id into cookies
cookies.permanent.signed[:user_id]=user.id
#add the user remember token into cookies
cookies.permanent[:remember_token]	=user.remember_token
end
#define the forget method
def forget user
	#call forget method which locate at app/model/users that its' function is use for make empty remember digest in database
	user.forget
	#delete user_id in cookies
	cookies.delete(:user_id)	
	#delete user remember_token in cookies
	cookies.delete(:remember_token)
end
#define method to check weather user is current user
def current_user? user
	#Return true if the given user is the currect user
	user==current_user	
end
#Redirects to stored location (or to default).
def redirect_back_or default
	#redirect to session with forwarding key or with default
	redirect_to(session[:forwarding_url] || default)
	#delete the session with the forwarding_url key
	session.delete(:forwarding_url)
end
#Store the URL trying to be accessed.
def store_location
	#set the session with forwarding_url key from request url if user have request is true
	session[:forwarding_url]=request.url if request.get?
end
end
