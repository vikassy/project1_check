class ForumsController < ApplicationController
before_filter :signed_in_user , only: [:create ,:destroy]
before_filter :correct_user,    only: :destroy

  def new
    @forum = Forum.new
  end
  def create 
    @forum = current_user.forums.build(params[:forum])
    if @forum.save
      flash[:success] = "Forum Created!"
      redirect_to forums_path
    else 
      render :action => "new"
    end
  end
  def index
    @forum = Forum.all
  end
  def edit
    @forum = Forum.find(params[:id])
  end
  def show 
    @forum = Forum.find(params[:id])
  end
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to forums_url 
  end
private

def correct_user
  @forum = current_user.forums.find_by_id(params[:id])
rescue
  redirect_to root_path 
end

end
