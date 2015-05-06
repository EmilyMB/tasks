class ListsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @lists = List.where(archived: false)
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.where(complete: false).order(sort_column + " " + sort_direction)
  end

  def complete
    @list = List.find(params[:id])
    @tasks = @list.tasks.where(complete: true).order(sort_column + " " + sort_direction)
  end

  def new
    @list = List.new
  end

  def create
    list = List.create(list_params)

    redirect_to list_path(list)
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update_attributes(list_params)

    redirect_to list_path(id: params[:id])
  end

  def destroy
    List.find(params[:id]).delete

    redirect_to lists_path
  end

  def archived
    @lists = List.where(archived: true)
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
