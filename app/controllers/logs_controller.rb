class LogsController < ApplicationController
  def show
    @log = Log.find(params[:id])
    @experiment = @log.experiment
    @scientist = @experiment.scientist
    @logs = @experiment.logs.where(subject_name: @log.subject_name)
  end

  def new
    @experiment = Experiment.find(params[:experiment_id])
    @log = @experiment.logs.new
    @scientist = @experiment.scientist
  end
end
