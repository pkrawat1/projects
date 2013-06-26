class SurveysController < ApplicationController
  def index
    @surveys=Survey.all
  end

  def new
    @survey=Survey.new
    3.times do
      @survey.questions.build
      4.times do
        @survey.questions.last.options.build
      end
    end
  end

  def create
    @survey=Survey.new(params[:survey])
    flag=true
    print params
    if @survey.questions.length > 2 and @survey.questions.each{|q| flag=false if q.options.length != 3}
      if @survey.save! and flag
        redirect_to surveys_path
      else
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end

  def edit
    @survey=Survey.find(params[:id])
  end

  def update
    @survey=Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to surveys_path
    else
      render action: 'edit'
    end
  end
  
  def destroy
    Survey.destroy(params[:id])
    render action: 'index'
  end

end
