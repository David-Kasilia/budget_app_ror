class EntityController < ApplicationController
  def index
    @entities = Entity.all
  end

  def show
    @entity = Entity.find_by(id: params[:id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id
    @entity.group_id = params[:group_id]

    if @entity.valid?
      @entity.save
      redirect_to user_group_entity_index_path(id: current_user.id, group_id: params[:id])
    else
      render new
    end
  end

  def destroy
    @entity = Entity.find_by(id: params[:id])

    redirect_to user_group_entity_index_path(id: current_user.id, group_id: params[:id])

    if @entity.destroy
      flash[:notice] = 'Entity was successfully destroyed.'
    else
      flash[:alert] = 'Entity was not destroyed.'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :author_id, :group_id)
  end
end
