#**********************************
# User Survey Programs uses Classes
#**********************************
require "csv"
#classes required******************

class Survey_ques
	protected
	attr_accessor :ques, :answer
	def attempt_ques(line)
		@ques=line[0]
		print "\n\t#{ques}"
		(line.length-1).times {|q| print "\n\t\t#{q+1}. #{line[q+1]}"}
		loop do
			print "\n\tSelect ur option : "
			@answer=gets.chomp.to_i
			break if @answer > 0 and @answer < line.length
		end
	end
end

class Survey < Survey_ques 							#For taking servey 
	attr_accessor :survey_for
	survey_no=0
	def show_types_servey()
		@survey_for=CSV.read("total_servey.csv")
		print "\n\tLIST OF SERVEY'S"
		@survey_for.each { |survey| print "\n\t\t#{survey[0]}. #{survey[1]}"  }
		print "\n\tPlease select ur Survey : "
		survey_no=gets.chomp.to_i
		show_survey_ques(@survey_for[survey_no-1][0].to_s.split(" ")[1]) if survey_no > 0
	end
	def show_survey_ques(file)
		CSV.foreach("#{file}.csv") do |line|
			ques=Survey_ques.new	
			ques.attempt_ques(line)
		end
	end
end

class User	
	attr_accessor :name
	def start_servey()
		print "\n\t\t\t\t\t\tSurvey for : #{@name}"
		user_servey=Survey.new
		user_servey.show_types_servey()				
	end
end


#*****Survey Function for user*****
def take_survey(user_name)
	loop do
		system("clear")
		print"\n\t***********************************\n\tWELCOME TO SURVEY PROGRAM\n\t***********************************"
		new_user=User.new					#create object of class User for new entry
		new_user.name=user_name		#Take the name of the user into instance variable 
		new_user.start_servey()
		print "\n\n\t!!!!Want to do new survey : "
		break if gets.chomp.index("n")!=nil
	end
end
#**********************************


system("clear")
print"\n\t***********************************\n\tWELCOME TO SURVEY PROGRAM\n\t***********************************\n\n\tEnter Your Name : "
user_name=gets.chomp.upcase
take_survey(user_name)

