class Qanswer < ActiveRecord::Base
  attr_accessible :desc, :option_id, :question_id, :user_id
	validates :desc,:question_id,:user_id,:option_id, presence: {message: 'is not present'}	
	validates :desc, length:{in: 10..500}
	validates :question_id, :user_id, :option_id , numericality: {only_integer: true}
end
