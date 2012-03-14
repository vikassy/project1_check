class CommentsController < ApplicationController 
  
  def new
    @comment = Comment.new(forum_id: params[:id])  
   #@comment = Comment.new(params[:Comment])
  end
  def create
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Commented!"
      redirect_to forums_path
    else
      render :action => "new"
    end
  end
  def index
    @com = Comment.all
  end
  def show 
    @comment = Comment.find_by_forum_id(params[:id])
  end
end
 
