class Qanswer < ActiveRecord::Base
  attr_accessible :desc, :option_id, :question_id, :user_id
end
