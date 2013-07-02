require 'spec_helper'

describe Survey do

let(:survey) { Survey.new(name: 'tree', year: '2111') }
#let(:invalid_survey) { Survey.new }  # tests the code when no name and year specified 
let(:invalid_survey_name) { Survey.new(year: '2011') }  # tests when only year is specified
let(:invalid_survey_year) { Survey.new(name: 'tree') }  # test when only names is specified

  it "must have a name" do 
    survey.save
    survey.should be_valid
    invalid_survey_name.should have(0).errors_on(:year)
    invalid_survey_name.should have(1).errors_on(:name)
  end

  it "must have a year" do
    survey.save
    survey.should be_valid
    invalid_survey_year.should have(1).errors_on(:year)
    invalid_survey_year.should have(0).errors_on(:name)
  end

  it "should not be valid without year" do
    invalid_survey_year.save
    invalid_survey_year.should have(0).errors_on(:name)
    invalid_survey_year.should have(1).errors_on(:year)
    invalid_survey_year.should_not be_valid
  end

  it "should be invalid without name" do
    survey.name = nil  # if name is nil then this will fail as we have validations on name
    survey.save
    survey.should_not be_valid
  end
   
  it "should have atleast 3 questions" do

  end

  it "question should be unique for survey" do
    
  end
end
