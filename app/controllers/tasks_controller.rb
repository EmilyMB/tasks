class TasksController < ApplicationController
  def new
    @task = Task.new(list_id: params[:list_id])
  end

  def create
    task = Task.create(task_params)

    redirect_to list_path(id: task.list_id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(task_params)

    redirect_to list_path(id: task.list_id)
  end

  def change_status
    task = Task.find(params[:id])
    task.update_attributes(task_params)

    redirect_to root_path
  end

  def remove_file
    task = Task.find(params[:id])
    task.file = nil
    task.save

    redirect_to list_path(id: task.list_id)
  end

  private

  def task_params
    params.require(:task)
      .permit(:title, :complete, :description, :due_date, :list_id, :file)
  end
end
