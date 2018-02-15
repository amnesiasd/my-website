class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update, :destroy]


  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post has been created'
    else
      redirect_to new_post_path, notice: 'There was a problem with the post.'
    end

  end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post has been updated.'
    else
      redirect_to edit_post_path, notice: 'There was a problem updating post.'
    end
  end

  def destroy
    # now using before_action
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post deleted.'
  end

  def index
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    # @post = Post.find(params[:id])
  end


  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end