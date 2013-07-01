class UserInfo < ActiveRecord::Base
  attr_accessible :email, :location, :user_id
	belongs_to :user
end
