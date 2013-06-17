class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :role_id
end
