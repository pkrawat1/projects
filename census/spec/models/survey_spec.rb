require 'spec_helper'

describe Survey do
	#let(:survey) {Survey.new(name: 'Tree Census',year: '2013')}
	let(:invalid_survey){Survey.new}	
	let(:invalid_survey_year){Survey.new(name:'Tree Census')}	
	let(:invalid_survey_name){Survey.new(year: '2013')}	

	it "must have a name" do
		invalid_survey_name.should have(1).errors_on(:name)
	end

=begin
	it"should not be valid without name" do
		invalid_survey_name.should have(1).errors_on(:name)
=end
	
	it "must have a year" do
    invalid_survey_year.should have(1).errors_on(:year)
  end
    
end
