class CategoriesController < ApplicationController
  before_action :logged_in_user, only:[:index, :edit, :update,:destroy]

  def index  
    @categories=Category.all  	
  end
end
