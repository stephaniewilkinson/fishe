class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.all
  end

  def show
    @experiment = Experiment.find(params[:id])
    @scientist = @experiment.scientist
    @logs = @experiment.logs
  end

  def new
    @scientist = Scientist.find(params[:scientist_id])
    @experiment = @scientist.experiments.new
    @log = @experiment.logs.new
  end

  def create
    @scientist = Scientist.find(params[:scientist_id])
    @experiment = @scientist.experiments.new experiment_params
    if @experiment.save
      redirect_to(
        scientist_path(params[:scientist_id]),
        notice: "Experiment and its first log were created"
      )
    else
    end
  end

  def edit
    @experiment = Experiment.find(params[:scientist_id])
  end

  private
    def experiment_params
      params.require(:experiment).permit(
        :name,
        :summary,
        :budget,
        log_attributes: [
          :subject_name,
          :weight,
          :treatments,
          :deceased,
          :comment
        ]
      )
    end
end
