class Question < ActiveRecord::Base
  attr_accessible :desc, :survey_id
	belongs_to :survey
	has_many :options, dependent: :destroy
end
