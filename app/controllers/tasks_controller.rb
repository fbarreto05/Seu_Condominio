class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    
    respond_to do |format|
      if @task.save
        Commentary.create(
          name: "Fulana",
          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et massa nec enim congue malesuada et nec nunc. Integer pharetra interdum sapien nec feugiat. Ut mattis felis a accumsan dignissim. Aliquam cursus urna lacus, id egestas sem varius sit amet. Donec bibendum risus eu bibendum scelerisque. Aliquam placerat tristique est. Ut sed ultricies erat. Suspendisse non eleifend risus, nec luctus ipsum. Pellentesque rhoncus odio vitae fermentum tempor. Nam ac faucibus tortor. Praesent pellentesque augue vitae ligula iaculis, a accumsan eros maximus. In ut ipsum magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut a eleifend quam. Nulla facilisi.",
          date: Date.today,
          task_id: @task.id
        )
        format.html { redirect_to tasks_path, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: tasks_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: "Task was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Task was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :name, :beginning, :end, :estimated_cost, :status ])
    end
end
