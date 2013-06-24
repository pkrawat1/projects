class Question < ActiveRecord::Base
  attr_accessible :desc, :survey_id
  belongs_to :survey
  validates :desc, uniqueness: {scope: :survey_id},presence: :true, length: {minimum: 10}
end
