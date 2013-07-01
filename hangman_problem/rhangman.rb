def hangman(life)
	case life
		when 0
			print "\n-----\n|\n|\n|\n|\n|___\n"
		when 1
			print "\n-----\n|   |\n|   O\n|\n|\n|___\n"
		when 2
			print "\n-----\n|   |\n|   O\n|  /\n|\n|___\n"
		when 3
			print "\n-----\n|   |\n|   O\n|  / \\\n|\n|___\n"
		when 4
			print "\n-----\n|   |\n|   O\n|  /|\\\n|\n|___\n"
		when 5
			print "\n-----\n|   |\n|   O\n|  /|\\\n|  /\n|___\n"
		when 6
			print "\n-----\n|   |\n|   O\n|  /|\\\n|  / \\\n|\n"
	end
end
def play_game (attempted,ran_word,wrong_attempt,guess)
	loop  do 																				#loop until success or failure
		miss= 0								#missmatch counter for each iteration in random array
		print "Enter random word : "
		usr_ip=gets.chomp														#user input
		if attempted.index(usr_ip)==nil && usr_ip.length==1 && usr_ip!='\n' 							 #find any occerance of input in attempted array
			attempted << usr_ip 														#append input to attempted array
			ran_word.each_with_index do |val,index| 
				val==usr_ip ? guess[index]=val : miss+=1						
			end
			wrong_attempt+=1 if miss==ran_word.length
			print "\n\t\t\t\tguessed word :#{guess}\n\t\t\t\tWrong attempts : #{wrong_attempt}\n\t\t\t\tAttempted words : "
			attempted.each {|ch| print "#{ch} "}
			hangman(wrong_attempt) 
			if guess.index("_")==nil 
				print "\n\t**************WOW!!!!YOU R SAFE*****************"
				break
			end
			if wrong_attempt==6
				print "\n\t!!!!!!!!!!!!!!!!YOU ARE DEAD!!!!!!!!!!!!!!!!!!!!!\n\n\t\t\tGAME OVER!!!!!!!"
				break
			end
		else
			print "\n\t\t!!!!!WARNING :INVAILD/REPEATED....\n"
		end
	end
end
loop do 
	print "\n***************WELCOME TO HANGMAN**************\n"
	ran_word=[] #Random Word from file
	wrong_attempt= 0 #no of wrong attempts
	attempted=[] #array of attempted words to avoid repeatition
	ran_word=File.new("hangman.txt","r").readlines().sample.chomp.downcase.split("") #select ne random string nd split in to char array
	guess="_"*ran_word.length 										#insert underscore at each location
	play_game(attempted,ran_word,wrong_attempt,guess) #call game function
	print "\nWANT TO PLAY AGAIN : "
	break if gets.chomp.index("n")!=nil
end
