class GroupController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.where(author: current_user).includes(:group_entities).order(created_at: :desc).limit(10)
    @name = current_user.name
  end

  def show
    @group = Group.find_by(id: params[:id])
    @group_entities = GroupEntity.includes(:entity).where(group_id: @group).order(created_at: :desc)
    @total = 0
    @group_entities.each { |e| @total += e.entity.amount }
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @group.author = current_user
    if @group.valid?
      @group.save
      redirect_to user_group_index_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    redirect_to user_group_index_path(current_user.id)
    if @group.destroy
      flash[:notice] = 'Group was successfully destroyed.'
    else
      flash[:alert] = 'Group was not destroyed.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
