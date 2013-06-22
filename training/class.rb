class Father 
	#def initialize #default constructor with parameter value	
	#end
=begin
	def name
	 @name
	end
	def name=(value)
		@name=value
	end
private
	def foo(a,b,value=1,*arg,d:4,**kwargs) #(var1,var2,default=val,*splat,default : val,**keywordparameteiwi)
		p value,a,b,d,arg,kwargs
	end
public
	def bar (kwargs={})
	
	end
=end
	attr_accessor :name, :age ,:address
	[:name,:age].each do |name|
		self.class.send(:define_method,name)do 
			instance_eval "@#{name}"
		end
		
	end
end

=begin
class Child < Father
	def testing
		foo(3,4,5,6,7,8,d:5,e:6)
	end
end

class GrandChild < Child
	def gtest
		foo(3,4,5,6,7,8,d:5,e:6)
	end
end
=end
f=Father.new
#c=GrandChild.new
#c.gtest
f.name="vinod"
p "#{f.name} #{f.age} #{f.address}"
#f.bar(a:1,b:2)
