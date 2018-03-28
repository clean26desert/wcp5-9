class BooksController < ApplicationController
  before_action  :authenticate_user!

  def index
      @books = Book.all
      @book = Book.new
      @users = User.all
      @user = current_user
  end

  def create
    # ストロングパラメーターを使用
    book = Book.new(book_params)
    # 異なるテーブルのカラムの関連付け
    book.user_id = current_user.id
    # DBへ保存する
    book.save
    # 新規投稿画面へリダイレクト
    redirect_to book_path(book)
  end

  def show
    # ストロングパラメーターを使用
    @book = Book.find(params[:id])
    @user = current_user
    @users = User.all
   end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id then
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    # ストロングパラメーターを使用
    book = Book.find(params[:id])
    if @book.user_id == current_user.id then
      # 対象をDBから破棄
      book.destroy
      # 一覧画面へリダイレクト
      redirect_to books_path
    end
  end

  def update
    # ストロングパラメーターを使用
    book = Book.find(params[:id])
    # 対象をDBで更新
    book.update(book_params)
    # 新規投稿画面へリダイレクト
    redirect_to book_path(book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
