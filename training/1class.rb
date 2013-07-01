=begin
class Base
	def self.class_meth2
		a "self.meth2"
	end
end

a=Base.new

def a.obj_method
	p "Only a"
end

def Base.class_meth1
	p "Base.class_meth1"
end

system("clear")

#b.obj_meth
a.obj_method
Base.class_meth1
#b.class_meth1

class Array
	def mysort
		p "MYSORT"	
	end
	def sort
		p "mysort"
		super
	end
end

a=[1,2,3]
p a.class
a.sort
a.mysort
=end
module Superman
	def fly
		p 'superman :fly'
	end
end

module Spiderman
	def cry
		p 'spiderman :fly'
	end
end

module Ironman
	def fly
		p 'ironman :fly'
	end
end
class Shaktiman
	include Superman
	include Ironman
	include Spiderman
	
	extend Superman
end
system("clear")
s=Shaktiman.new
Shaktiman.fly
s.fly
s.cry
p s.is_a?(Ironman)
p s.is_a?(Superman)
p s.is_a?(Spiderman)
p s.is_a?(Shaktiman)
