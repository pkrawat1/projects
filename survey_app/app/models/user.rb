class Testing < ActiveModel::Validator
	def validate(record)
		if options[:fields].all? do |field| 
				if	record.send(field)!=nil
					if	record.send(field).include? "Evil" and record.send(field)!=nil
						record.errors[:"#{field}"] << "is Evil"
					end
				end
			end
		end
	end
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << "is not valid..."
    end
  end
end

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :role_id
	has_one :user_info
	has_and_belongs_to_many :surveys
	validates	:name,	:email,	:password,	:role_id, presence: {message: 'is not present'}
	validates	:email, uniqueness: true, email: true #:case_sensitive is true by default
	validates_with Testing, fields: [:name,:email]
	before_validation :ensure_name_has_a_value

	def ensure_name_has_a_value
 		if !name.nil?
 	 		name.capitalize!
  	end
 	end

	after_initialize do |user|
    puts "You have initialized an object!"
  end	

	after_find do |user|
    puts "You have found an object!"
  end
end

