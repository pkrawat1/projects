require 'spec_helper'

describe Question do
  let(:question){Question.new}
  
  it "must have description" do
    question.should have(2).errors_on(:desc)
  end

  it "must be unique" do
    Question.create(desc: 'question no 1', survey_id: 1)
    question=Question.new(desc: 'question no 1',survey_id: 1)
    question.save
    question.should have(1).errors_on(:desc)
  end
    
  it "question must be 10 characters long" do
    question.desc="ques"
    question.should have(1).errors_on(:desc)
  end
end
