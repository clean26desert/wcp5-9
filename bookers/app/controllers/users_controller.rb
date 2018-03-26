class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # ストロングパラメーターを使用
		@user = User.find(params[:id])
		@books = Book.all
		@book = Book.new
  end

  def index
  	@users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    # ストロングパラメーターを使用
  	@user = User.find(params[:id])
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
