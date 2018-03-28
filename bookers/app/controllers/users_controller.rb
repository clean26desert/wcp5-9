class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # ストロングパラメーターを使用
		@user = User.find(params[:id])
		@book = Book.new
    @books = Book.all
  end

  def index
  	@users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    # ストロングパラメーターを使用
  	@user = User.find(params[:id])
    unless @user.id == current_user.id then
        redirect_to users_path
      end
  end

  def update
    # ストロングパラメーターを使用
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
      params.require(:user).permit(:name, :image, :introduct)
  end
end
