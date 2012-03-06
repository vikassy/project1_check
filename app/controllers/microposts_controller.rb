class MicropostsController < ApplicationController
before_filter :signed_in_user , only: [:create ,:destroy]
before_filter :correct_user,    only: :destroy

def create 
@micropost = current_user.microposts.build(params[:micropost])
  if @micropost.save
    flash[:success] = "Micropost Created!"
    redirect_to root_path
  else
    @feed_items = []
    render 'pages/home'
  end
end

  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end

def index
end
private

def correct_user
  @micropost = current_user.microposts.find_by_id(params[:id])
rescue
  redirect_to root_path 
end
end
