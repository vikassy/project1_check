class ComsController < ApplicationController
  def new
    @com=Com.new(micropost_id: params[:id])
  end
  def create 
    @com = current_user.coms.build(params[:com])
    if @com.save
      flash[:success] = "Post Replied!"
      redirect_to root_path
    else  
      render action: new 
    end
  end
  def index
    @com = Com.all
  end
  def show 
    @com = Com.find_by_micropost_id(params[:id])
  end
end


