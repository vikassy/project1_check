class UsersController < ApplicationController
  def new
    @title = 'Sign Up'
    @user = User.new  
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create 
    @user=User.new(params[:user])
    if @user.save 
      flash[:success] = "Welcome to Rails on Ruby Discussion Forum"
      redirect_to @user
    else 
      render 'new'
    end
  end 
end
