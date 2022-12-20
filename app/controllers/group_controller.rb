class GroupController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by(id: params[:id])

  end

  def new
    @group = Group.new
  end

  def create
    @author = User.find_by(id: params[:id])
    @group = @author.groups.new(group_params)
    if @group.valid?
      @group.save
      redirect_to user_group_index_path(id: current_user.id)
    else
      render :new
    end
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    redirect_to user_group_index_path(id: current_user.id)
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
