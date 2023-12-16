class Public::PermitsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.permits.find_or_create_by!(group_id: params[:group_id])
    redirect_to request.referer, notice: "グループへ参加申請をしました"
  end
  
  # グル-プに対するpermitの一覧
  def show
    @group = Group.find(params[:group_id])
  end
  
  # 自分が申請したグル-プに対するpermitの一覧
  def my_index
    group_ids = Permit.where(user_id: current_user.id).pluck(:group_id)
    @groups = Group.where(id: group_ids)
  end

  def destroy
    group = Group.find(params[:group_id])
    if group.is_owned_by?(current_user)
      permit = group.permits.find_by!(user_id: params[:user_id])
    else
      permit = group.permits.find_by!(user_id: current_user.id)
    end
    
    permit.destroy!
    redirect_to request.referer, notice: "グループへの参加申請を取消しました"
  end
end
