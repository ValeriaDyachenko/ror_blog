class PostsController < ApplicationController
  # метод просмотра постов
  def index
    @posts = Post.all
  end

  # перенаправление на создание нового поста
  def new
  end

  # создание поста
  def create
 	  @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  # просмотр поста
  def show
    @post = Post.find(params[:id])
  end

  #редактирование поста
  def edit
    @post = Post.find(params[:id])
  end

  #обновление поста
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  #удаление поста
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  #получение параметров поста
  private
    def post_params
      params.require(:post).permit(:title,:body)
    end
end