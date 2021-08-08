class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
    # @blogs = Blog.all.order(id: "DESC")    # データ逆に表示
    # binding.pry     # ブレークポイントを仕込む
    # binding.irb     # Gemを入れなくてもbinding.pryと同じ機能が使える
  end

  def new
    @blog = Blog.new   # ビューにデータを渡す(インスタンス変数を定義する)
  end

  #def create
  #  Blog.create(blog_params)
  #  redirect_to new_blog_path #redirect_to "/blogs/new" と同じ
  #end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
        redirect_to blogs_path, notice: "ブログを作成しました！"
        else
          # 入力フォームを再描画します。
          render :new
        end
      end
  end

  def show
    # @blog = Blog.find(params[:id])    # 2行目のbefore_action :set_blog, only: [:show, :edit, :update]より定義済
  end

  def edit
    # @blog = Blog.find(params[:id])    # 2行目のbefore_action :set_blog, only: [:show, :edit, :update]より定義済
  end

  def update
    # @blog = Blog.find(params[:id])    # 2行目のbefore_action :set_blog, only: [:show, :edit, :update]より定義済
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm      # 確認画面用
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?   #valid?/invalid?メソッドは、バリデーションを実行し、失敗したらfalse/trueを返します。
  end


  private
  def blog_params          # Strong Parameters
    params.require(:blog).permit(:title, :content)
  end

  def set_blog             # 2行目のbefore_action :set_blog, only: [:show, :edit, :update]のため
    @blog = Blog.find(params[:id])
  end

end