class TasksController < ApplicationController
  def new
  end

  def create
    task = Task.create(task_params)

    redirect_to task_path(task)
  end

  def edit
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(task_params)

    redirect_to task_path(id: params[:id])
  end

  private

  def task_params
    params.require(:task)
      .permit(:title, :complete, :description, :due_date, :list_id)
  end
end
