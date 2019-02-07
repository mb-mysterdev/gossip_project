class CommentsController < ApplicationController
  def new
  end
  def edit
  end
  def create
    puts params
    @comment = Comment.new(content: params[:content], user_id: session[:user_id], gossip_id: params[:gossip_id])
    if @comment.save
      redirect_to gossip_path(params[:gossip_id])
    else
    end
  end
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(content: params[:content], user_id: session[:user_id])
      puts 1
      redirect_to gossip_path(params[:gossip_id])
    else
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id])
  end
  def show
  end
end
