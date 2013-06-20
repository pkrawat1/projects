class Survey < ActiveRecord::Base
  attr_accessible :name, :year
	validates :name,:year, presence: :true
end
