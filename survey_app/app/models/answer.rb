class Answer < ActiveRecord::Base
  attr_accessible :desc, :question_id, :user_id,:option_id,:role_id
end
