class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render 'show' 
    else 
      redirect_to 'new'
    end
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :phone, :email)
    end

end
