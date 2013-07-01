#Programe for obtaining Sales from a data record of products
#************************************************************
							#SP  TS  CT
data_record=[                                       					#sales for person(SP)
            	[ 4 , 4 , 4 ,"amit","pune","1-sep-13","D1"],		#pune	#Total sales Till that Date(TS)		
							[ 3 , 7 , 3 ,"anil","mumbai","1-sep-13","D2"],	#mumbai	#Total sales Till that Date for a city (CT)	
							[ 4 , 11, 8 ,"amit","pune","2-sep-13","D2"],		#pune
							[ 2 , 13, 4 ,"sumit","delhi","3-sep-13","D3"]		#delhi
            ]

index_sales_person={
											"amit" =>[0,2],
											"anil" =>[1],
											"sumit"=>[3]
								   }

index_city={
					 		"pune"  =>[0,2],
							"mumbai"=>[1],
							"delhi" =>[3]	
					 }

index_date={
					 		"1-sep-13"=>[0,1],
							"2-sep-13"=>[2],
							"3-sep-13"=>[3]	
					 }

index_product={
								"D1"=>[0],
								"D2"=>[1,2],
								"D3"=>[3]	
							}

input_query={
							:name=>nil,
							:city=>nil,
							:date=>nil,
							:product=>nil,
							:month=>nil,
							:range_dates=>nil	
						}

loop do
	p "Enter your query with spaces"
	input_query.each do |key,val|
		p key.upcase 
		input_query[key]=gets.chomp
	end
	get_data=
	p get_data
	#get_data.each {|index| data_record[index]}
	p "Want to enter another query"
	break if gets.chomp.index('n')!=nil	
end


