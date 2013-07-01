class Answer < ActiveRecord::Base
  attr_accessible :user_id, :option_id, :question_id, :survey_id
  belongs_to :user
  belongs_to :question
end
