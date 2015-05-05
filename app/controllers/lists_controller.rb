class ListsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    list = List.create(list_params)

    redirect_to list_path(list)
  end

  def edit
  end

  def update
    list = List.find(params[:id])
    list.update_attributes(list_params)

    redirect_to list_path(id: params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end
end
