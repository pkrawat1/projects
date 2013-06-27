class Survey < ActiveRecord::Base
  attr_accessible :name, :year, :questions_attributes
  has_many :questions, dependent: :destroy
  has_many :options ,through: :questions
  has_many :answers ,through: :users
  has_and_belongs_to_many :users
	validates :name, presence: :true,uniqueness: :true, length: {minimum: 4, message: 'must be 4 characters long'}
  validates :year, numericality: :true
  validates :questions, length: {minimum: 3, message: 'must have atleast 3 questions'}
  accepts_nested_attributes_for :questions
end
