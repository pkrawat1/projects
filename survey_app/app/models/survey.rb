class Survey < ActiveRecord::Base
  attr_accessible :name, :s_type
	has_many :questions, dependent: :destroy
	has_many :options, through: :questions, dependent: :destroy 
	has_and_belongs_to_many :users
	validates :name,:s_type,presence: { message:'not present'},length: {	in: 6..20,
																																				too_short: 'must be atleast %{count} characters',
																																				too_long: 'must not exceed 20 characters'
																																		 }
	after_validation  :message
	def message
		p "Validation"
	end	
end
