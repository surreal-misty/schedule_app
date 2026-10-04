class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "スケジュールを登録できませんでした"
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "スケジュールを更新しました"
      redirect_to @post
    else
      flash.now[:alert] = "スケジュールを更新できませんでした"
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :start_date, :end_date, :all_day)
  end
end
