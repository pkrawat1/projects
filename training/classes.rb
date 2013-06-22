class Father
	def foo(value, &blk)

		if blk and blk.arity == 1
			p 'arity'
		elsif blk and blk.arity ==0
			p 'no arity'
			#p blk.arity   # ?
			#yield(value.to_s) #uncommet to see the yeild result
		end
		if value==1
		  '1'
		else
		  '2'
		end
	end
	
end

class Child < Father
end

f=Father.new
#p f.foo     #
#p f.inspect 
sum = 0
f.foo 2 do |num|
	p "#{sum} YIPPE "+ num
	sum =100
end
#p sum
#f.foo(2)
