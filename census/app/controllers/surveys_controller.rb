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
      redirect_to action: 'index'
    else
      render action: 'new'
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
