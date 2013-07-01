require 'spec_helper'

describe Question do
  let(:question){Question.new}
  let(:invalid_no_of_options){Question.new(desc: 'question no 1')}
  
  it "must have description" do
    question.should have(2).errors_on(:desc)
  end
  
  it "must have 4 options" do
    invalid_no_of_options.should have(1).errors_on(:options)
  end
  
  it "question must be 10 characters long" do
    question.desc="ques"
    question.should have(1).errors_on(:desc)
  end
end
