class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your new posting was created."
      render 'show' 
    else 
      flash[:danger] = "There was an error."
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Your posting was updated."
      render 'show' 
    else 
      flash[:danger] = "There was an error."
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 25)
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "That post was deleted."
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :phone, :email)
    end

end
