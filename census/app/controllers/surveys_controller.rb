class SurveysController < ApplicationController
  def index
    @surveys=Survey.all
  end

  def new
    @survey=Survey.new
  end

  def create
    @survey=Survey.new(params[:survey])
    if @survey.save
      redirect_to surveys_path
    else
      render action: 'new'
    end
  end

end
