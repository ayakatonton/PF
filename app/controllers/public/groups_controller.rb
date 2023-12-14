class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
 
  def index
    @photo = Photo.new
    @schedule = Schedule.new
    @event = Event.new
    @groups = Group.all
    @user = User.find(current_user.id)
  end

  def show
    @photo = Photo.new
    @schedule = Schedule.new
    @event = Event.new
    @group = Group.find(params[:id])
    @user = User.find(params[:id])
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
    method = params[:search_method]
    word = params[:search_word]
    @group = Group.search(method,word)
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
      unless @group.owner_id == current_user.id
        redirect_to groups_path(@group), alert: "グループ制作者のみ編集ができます"
      end
    end
end
