class SurveysController < ApplicationController
  def index
    @surveys=Survey.all
  end

  def new
    @survey=Survey.new
    3.times do
      question = @survey.questions.build
    end
  end

  def create
    @survey=Survey.new(params[:survey])
    if @survey.save
      redirect_to surveys_path
    else
      render action: 'new'
    end
  end
  
  def update
    if @survey.update_attributes(params[:survey])
      redirect_to surveys_path
    else
      render action: 'edit'
    end
  end

  def edit
    @survey=Survey.find(params[:id])
  end

  def update
    redirect_to action: 'create'
  end

  def destroy
    Survey.destroy(params[:id])
    redirect_to action: 'index'
  end
end
