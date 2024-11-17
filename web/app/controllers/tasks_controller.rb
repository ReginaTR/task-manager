class TasksController < ApplicationController
  before_action :set_ransack_params, only: [:index]
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result.order(status: :asc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Tarefa criada com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Tarefa atualizada com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Tarefa excluída com sucesso." }
    end
  end

  private

    def set_ransack_params
      @q = Task.ransack(ransack_params)
    end
    
    def ransack_params
      params.fetch(:q, {}).permit(:s, :title, :url, :status, :description)
    end
    
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :url, :status, :description)
    end
end
