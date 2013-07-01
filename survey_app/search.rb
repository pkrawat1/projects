
t1=Time.now
s=Survey.first
s.questions.each do |ques|
	p ques.desc
	qid=ques.id
	op=Option.where(question_id: "#{qid}")
	op.each do |op|
			p "option : #{op.desc}"
	end
end
t2=Time.now
t3=t2-t1
p t3

t1=Time.now
s=Survey.first
s.questions.includes(:options).each do |ques|
	p ques.desc
	ques.options.each do |op|
		p op.desc
	end
end

t2=Time.now
t4=t2-t1
p t4
print "Time with egerloading : #{t4}\nWithout egar loading : #{t3}"

100.times do |x|
	Question.create(desc: "Question No : #{x}",survey_id: 10)
	q1=Question.last
	4.times do |y|
		Option.create(desc: "Option No : #{y}",question_id: "#{q1.id}")
	end
end





a=Survey.all
a.each do |s|
	s.questions.each do |ques|
		p ques.desc
		qid=ques.id
		op=Option.where(question_id: "#{qid}")
		op.each do |op|
			p "option : #{op.desc}"
		end
	end
end
