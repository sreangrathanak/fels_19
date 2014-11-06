class UsersController < ApplicationController
  def new
    #define user variable with empty value
    @user = User.new
  end
  #define the action show for the user
  def show
  	#declare user variable which can use in global 
  	#this variable take from the User table which find when we type user id(in web form)
  	@user=User.find(params[:id])
  	#user for debug when program have some problem and we wanna test
  	#debugger
  end
  def create
    #declare the user  which it attribute come from all value fill from the user by call method in private section
    @user=User.new user_params
    #if we can save the user
    if @user.save
        #set the flash methods with success message
        flash[:success]="Welcome to the E-Learning System"
        #link to the user profile
        redirect_to @user
    else #else
      #run the action new again
      render 'new'
    end
  end
  #private section
  private
    #define methods for get only the value that we need from the values that user fill
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
