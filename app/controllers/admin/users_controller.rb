class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all.page(params[:page]).per(5)
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
