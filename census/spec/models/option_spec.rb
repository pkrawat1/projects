require 'spec_helper'

describe Option do
  let(:option){Option.new}

  it "must have description" do
    option.should have(1).errors_on(:desc)
  end
  
  it "must be unique to a question" do
    Option.create(desc: 'option',question_id: 1)
    option.desc='option'
    option.question_id= 1
    option.should have(1).errors_on(:desc)
  end
    
end
