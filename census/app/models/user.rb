class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :answers_attributes
  # attr_accessible :title, :body
  has_many :answers
  accepts_nested_attributes_for :answers
  validates :name, presence: :true,
                           length: {minimum: 6},
                           format: {with: /\A[a-zA-Z]+\z/},
                           uniqueness: :true
end
