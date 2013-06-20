class SurveysUsers < ActiveRecord::Base
  attr_accessible :user_id, :survey_id
end
