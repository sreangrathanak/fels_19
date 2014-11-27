class Admin::UsersController < ApplicationController
  before_action :logged_in_user_admin, only:[:index, :edit, :update,:destroy, :show]  
  before_action :admin_user, only:[:index, :edit, :update,:destroy, :show]    
  
  def home
  end
  
  def new    
    @user = User.new
  end 

  def create    
    @user=User.new user_params    
    if @user.save                   
      flash[:success]="User #{@user.name}created!"        
      render "show"
    else 
      render "new"
    end
  end

  def show
  	 @user=User.find params[:id]
  end

  def index    
    @users=User.paginate page: params[:page]    
  end  

  def update    
    @user = User.find params[:id]    
    if @user.update_attributes user_params      
      flash[:success]="Profile update"      
      render "show"
    else      
      render "edit"
    end
  end  

  def edit    
    @user = User.find params[:id] 
  end 

  def destroy    
    user=User.find params[:id]    
    flash[:success]="User #{user.name} delete"    
    user.destroy
    redirect_to admin_users_url
  end  

  private 
     
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:isadmin)
    end    

    def admin_user
      redirect_to admin_root_url unless current_user.isadmin?            
    end
end
