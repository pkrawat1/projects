class Question < ActiveRecord::Base
  attr_accessible :desc, :survey_id, :options_attributes
  belongs_to :survey
  has_one :answer
  has_many :options, dependent: :destroy
  validates :desc, uniqueness: {scope: :survey_id},presence: :true, length: {minimum: 10}
  validates :options, length: {minimum: 4,message: 'must have 4 options'}
  accepts_nested_attributes_for :options
end
