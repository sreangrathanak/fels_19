class Admin::StaticPagesController < ApplicationController
	before_action :logged_in_user_admin, only:[:help,:about,:contact]  
  before_action :admin_user, only:[:help,:about,:contact]  
  
  def help
    @static_page=StaticPage.first
    if @static_page.nil?
      @static_page=StaticPage.create 
    else
      @static_page.update help:params[:help] unless params[:help].nil?
    end
  end

  def about
    @static_page=StaticPage.first
    if @static_page.nil?
      @static_page=StaticPage.create    
    else
      @static_page.update about:params[:about] unless params[:about].nil?
    end
  end

  def contact
    @static_page=StaticPage.first
    if @static_page.nil?
      @static_page=StaticPage.create    
    else
      @static_page.update contact:params[:contact] unless params[:contact].nil?
    end
  end

  private    
    def admin_user
      redirect_to admin_root_url unless current_user.isadmin?            
    end
end
