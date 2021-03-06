class Option < ActiveRecord::Base
   attr_accessible :desc, :question_id
   belongs_to :question
   validates :desc, uniqueness: {scope: :question_id},presence: :true
end
