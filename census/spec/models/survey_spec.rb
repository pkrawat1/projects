require 'spec_helper'

describe Survey do
	let(:survey) {Survey.new(name: 'Tree Census',year: '2013')}
	let(:invalid_length_name){Survey.new(name: 'abc')}	
	let(:invalid_survey_year){Survey.new(name:'Tree Census')}	
	let(:invalid_survey_name){Survey.new(year: '2013')}	
  let(:invalid_format_year){Survey.new(year: 'abc')}
    
	it "must have a name" do
		invalid_survey_name.should have(2).errors_on(:name)
	end

  it "must have 3 questions" do
    survey.should have(1).errors_on(:questions)
  end

	it"name should be at least 4 characters long" do
    invalid_length_name.should have(1).errors_on(:name)
  end
	
	it "must have a year" do
    invalid_survey_year.should have(1).errors_on(:year)
  end
  
  it "must have a valid year" do
    invalid_format_year.should have(1).errors_on(:year)
  end

end
