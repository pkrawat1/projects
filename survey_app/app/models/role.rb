class Role < ActiveRecord::Base
  attr_accessible :role_type
	validates :role_type,presence: {message: 'is not present'}
	validates :role_type, inclusion:{in: %w(admin user),message: '%{value} is not valid ROLE TYPE'}
	
end
