class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    @users = @users.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
    # 検索機能
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to admin_users_path
  end

  def new
  end

  def edit
  end
end
