class Question < ActiveRecord::Base
  attr_accessible :desc, :survey_id, :option_attributes
  belongs_to :survey, dependent: :destroy
  has_many :options
  validates :desc, uniqueness: {scope: :survey_id},presence: :true, length: {minimum: 10}
  accepts_nested_attributes_for :options
end
