class UsersController < ApplicationController
  #user methods before_action to check that user is logged in or not before they can view, edit, update or delete user profile
  before_action :logged_in_user, only:[:index, :edit, :update,:destroy]
  #user methods before_action to check that user is correct in or not before they can edit or update user profile
  before_action :correct_user,   only: [:edit, :update]
  #set permission to admin user
  before_action :admin_user, only: :destroy
  #define new action
  def new
    #define user variable with empty value
    @user = User.new
  end
  #define index action
  def index
    #declare users which store all user data in the form of pagination    
    @users=User.paginate(page: params[:page])    
  end
  #define the action show for the user
  def show
  	#declare user variable which can use in global 
  	#this variable take from the User table which find when we type user id(in web form)
  	@user=User.find(params[:id])
  	#user for debug when program have some problem and we wanna test
  	#debugger
    #declare user lesson to get all their lesson
     @lessons = @user.lessons.paginate(page: params[:page])
  end
  def create
    #declare the user  which it attribute come from all value fill from the user by call method in private section
    @user=User.new user_params
    #if we can save the user
    if @user.save
        #call log_in method to make a user sign up success login automatically
        #call the methos log_in which locate at app/helper/sessions_helper that we use to store the user id
        log_in @user
        #set the flash methods with success message
        flash[:success]="Welcome to the E-Learning System"
        #link to the user profile
        redirect_to @user
    else #else
      #run the action new again
      render 'new'
    end
  end
  #define action edit
  def edit
    #declare user to get from User where find from the id get from form
    @user = User.find(params[:id])
  end
  #define action edit
  def update
    #declare user to get from User where find from the id get from form
    @user = User.find(params[:id])
    #check if we can update user attribute with the value get from user filling
    if @user.update_attributes(user_params)
      # Set flash with success key
      flash[:success]="Profile update"
      #link to the current user
      redirect_to @user
    else
      #run the edit action
      render 'edit'
    end
  end
  #define delete action
  def destroy
    #find the user we want to delete which his/her id get from page
    User.find(params[:id]).destroy
    #set flash message eith success key about user delete info
    flash[:success]="User delete"
    #re link to all users again
    redirect_to users_url
  end
  #private section
  private
    #define methods for get only the value that we need from the values that user fill
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    #Confirms a logged in user
    def logged_in_user
      #check if user logged_in is true
      unless logged_in?
        #call the method store_location which locat at app/helper/session_helper
        store_location
        #set the flash message with danger key
        flash[:danger]="Please log in."
        #link to loggin page
        redirect_to login_url
      end
    end
    #Confirms the correct user.
    def correct_user
      #user assign from User table by find from the id that get from page
      @user=User.find(params[:id])      
      redirect_to(root_url) unless current_user?@user      
    end
    #Confirm an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.isadmin?            
    end
end
