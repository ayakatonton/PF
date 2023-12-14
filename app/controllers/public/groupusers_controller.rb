class Public::GroupusersController < ApplicationController
  before_action :authenticate_user! 
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end
   
  def create 
   group_user = current_user.group_users.new(group_id: params[:group_id])
   group_user.save
   redirect_to request.referer
    @group = Group.find(params[:group_id])
    @permit = Permit.find(params[:permit_id])
    @group_user = GroupUser.create(user_id: @permit.user_id, group_id: params[:group_id])
    @permit.destroy #参加希望者リストから削除する
    redirect_to request.referer
  end
  
  def destroy 
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to request.referer
  end
  
end
