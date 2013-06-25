class Survey < ActiveRecord::Base
  attr_accessible :name, :year, :questions_attributes
  has_many :questions
	validates :name, presence: :true,uniqueness: :true
  validates :name, length: {minimum: 4, message: 'must be 4 characters long'}
  validates :year, numericality: :true
  accepts_nested_attributes_for :questions
end
