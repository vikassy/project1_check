class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :update]
before_filter :correct_user ,  only: [:edit ,:update]
before_filter :admin_user,     only: :destroy
  def new
    @title = 'Sign Up'
    @user = User.new  
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @title = @user.name
  end
  def index  
    @title = "All users"
    @users = User.paginate(page: params[:page])
  end

  def create 
    @user=User.new(params[:user])
    if @user.save 
      sign_in @user
      flash[:success] = "Welcome to Rails on Ruby Discussion Forum"
      redirect_to @user
    else 
      render 'new'
    end
  end
 
  def edit 
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = " Information Updated "
      sign_in @user
      redirect_to @user	
    else 
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
private 
 
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path)  unless current_user?(@user)
  end

  def signed_in_user
    redirect_to signin_path , notice: "Please sign in" unless signed_in?
  end
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
