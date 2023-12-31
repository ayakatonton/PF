class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
 
  def index
    @photo = Photo.new
    @schedule = Schedule.new
    @event = Event.new
    @groups = Group.joins(:group_users).where(group_users: { user_id: current_user.id }).page(params[:page]).per(6)
    @user = User.find(current_user.id)
  end

  def show
    @photo = Photo.new
    @schedule = Schedule.new
    @event = Event.new
    @group = Group.find(params[:id])
    
  end

  def new
    @group = Group.new
  end

  def edit
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      @group.users << current_user
      redirect_to groups_path, method: :post
    else
      flash[:alert] = "同じ名前のグループが存在しています！"
      render 'new'
    end
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
  
  def search
    word = params[:search_word]
    if word.present?
      @group = Group.find_by(name:word)
    end

  end
  
  def permits
    @group = Group.find(params[:id])
    @permits = @group.permits.page(params[:page])
  end
  
  private
    def group_params
      params.require(:group).permit(:name, :introduction, :group_image)
    end
  
    def ensure_correct_user
      @group = Group.find(params[:id])
      if @group.owner_id != current_user.id && !@group.group_users.exists?(user_id: current_user.id)
        redirect_to groups_path(@group), alert: "グループのみ編集ができます"
      end
    end
end
