#**********************************
# User Survey Programs uses Classes
#**********************************
require "csv"
#classes required******************

class Survey_ques
	protected
	attr_accessor :ques, :answer
	def show_survey_ques(survey_file,user_name)
		CSV.open("#{user_name}.csv","ab") do |csv|			#create/open user file to store survey details
			read_file=CSV.read("#{user_name}.csv")				#check survey details already present or not
			read_file.each {|survey| return(1) if survey[0].index("#{survey_file}")!=nil} #verify one attempt for a survey
			CSV.foreach("#{survey_file}.csv") do |line|		
				@ques=line[0]
				print "\n\t#{ques}"
				(line.length-1).times {|q| print "\n\t\t#{q+1}. #{line[q+1]}"} #Print options
				loop do
					print "\n\tSelect ur option : "
					@answer=gets.chomp.to_i
					break if @answer > 0 and @answer < line.length
				end
					csv << ["#{survey_file}","#{@ques}","#{line[@answer]}"]		#appending to user file
			end
		end
	end
end

class Survey < Survey_ques 							#For taking servey 
	attr_accessor :survey_list
	survey_no=0
	def show_types_survey(user_name)
		@survey_list=CSV.read("total_servey.csv")
		print "\n\tLIST OF SERVEY'S"
		@survey_list.each { |survey| print "\n\t\t#{survey[0]}. #{survey[1]}"  }
		print "\n\tPlease select ur Survey : "
		survey_no=gets.chomp.to_i
		take_survey(user_name) if survey_no < 1 or survey_no > @survey_list.length 
		ques=Survey_ques.new
		selected_survey=@survey_list[survey_no-1][0].to_s.split(" ")[1]
		error=ques.show_survey_ques(selected_survey,user_name)
		if error==1
			print "\n\tU already took that survey......\n\tWant to reset ur details : "
			choice=gets.chomp
			if choice.index("y")!=nil
				File.open("#{user_name}.csv","w"){|file| file.truncate(0)} 
				print "\n\tData Reset SUCCESSFULL.....!!!"
			else
				print "\n\tData Reset FAILED....!!!"
			end
		end
	end
end

class User	
	attr_accessor :name
	def start_servey()
		print "\n\t\t\t\t\t\tSurvey for : #{@name}"
		user_servey=Survey.new
		user_servey.show_types_survey(@name)
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
loop do
	system("clear")
	print"\n\t***********************************\n\tWELCOME TO SURVEY PROGRAM\n\t***********************************"
	print "\n\t\t\t\t\t\tSurvey for : #{user_name}"
	print "\n\t1. Take a survey\n\t2. See results\n\t3. Exit\n\t\tEnter Choice : "
	choice=gets.chomp.to_i
	case choice
		when 1 
			take_survey(user_name)
		when 2 
			print "\n\tSurvey\t\tQues\t\t\t\t\t\tAnswer\n"
			CSV.foreach("#{user_name}.csv") {|line| print"\n\t#{line[0]}\t#{line[1]}\t\t\t#{line[2]}\n"}		#show user details of survey
			print "\n\n\t\tPRESS ANY KEY....."
			gets
		when 3
			break
		else	 
			p "Invalid Choce"
	end
end
