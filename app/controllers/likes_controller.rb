class LikesController < ApplicationController
  before_action :set_post

  def create
    if user_signed_in?
      @like = @post.likes.build(user: current_user)
    else
      # Handle anonymous likes with session
      @like = @post.likes.build(session_id: session.id.to_s)
    end
    
    if @like.save
      respond_to do |format|
        format.html { redirect_to @post }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { redirect_to @post }
        format.turbo_stream
      end
    end
  end

  def destroy
    if user_signed_in?
      @like = @post.likes.find_by(user: current_user)
    else
      @like = @post.likes.find_by(session_id: session.id.to_s)
    end
    
    if @like
      @like.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
