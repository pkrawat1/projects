class Option < ActiveRecord::Base
  attr_accessible :desc,:question_id
	belongs_to :question
	belongs_to :survey
	delegate :survey, to: :question
	validates :desc, length:{in: 4..100},presence: true
	validates :question_id, numericality: true,presence: true
end
