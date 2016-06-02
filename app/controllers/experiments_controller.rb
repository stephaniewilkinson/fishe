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

  def edit
    @experiment = Experiment.find(params[:scientist_id])
  end

end
