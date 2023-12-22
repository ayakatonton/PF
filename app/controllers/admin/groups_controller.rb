class Admin::GroupsController < ApplicationController
   
  def index
    @groups = Group.all
    @groups = @groups.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
    # 検索機能：名前で検索する場合。他の検索条件がある場合は適宜追加してください。
  end 
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "グループを削除しました"
    redirect_to admin_groups_path
  end

end
