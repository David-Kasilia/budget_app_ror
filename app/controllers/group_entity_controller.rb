class GroupEntityController < ApplicationController
  def index
    @group_entity = GroupEntity.all
  end

  def show
    @group_entity = GroupEntity.find_by(id: params[:id])
  end

  def new
    @entity = Entity.new
    @group = Group.where(author: current_user)
  end

  def create
    entity = Entity.create(name: entity_params[:name], author_id: current_user.id, amount: entity_params[:amount])

    if entity.save
      GroupEntity.create(entities_id: entity.id, groups_id: params[:group])
      redirect_to user_group_entity_index_path(current_user.id)
    else
      flash[:alert] = 'Entity Not Created'
    end
  end


  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
