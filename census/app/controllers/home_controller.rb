class HomeController < ApplicationController

  def index
    redirect_to surveys_path
  end

  def show
    @survey = Survey.find(params[:id])
    @user = User.find(current_user.id)
 		@questions = @survey.questions.includes(:options).each
  end

  def update
    @user = User.find(params[:id])
    params[:select].each do |ques|
      option=Option.find(ques[1])
      Answer.create(option_id: option.id, question_id: option.question_id, user_id: @user.id, survey_id: option.question.survey_id)
    end
    redirect_to surveys_path
  end

end
