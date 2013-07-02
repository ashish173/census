require 'spec_helper'

describe Option do
  it "desc should be present " do 
    option = Option.create()
    option.should have(2).errors_on(:desc)
  end

  it "for a question desc should be unique" do
    option1 = Option.create(desc: "option1")
    option2 = Option.create(desc: "option1")
    option2.should have(1).errors_on(:desc)
  end


  it "must be minimum 3 for a question" do
    option1.Option.create(desc: "options1")
    option2.Option.create(desc: "options2")
    optoin2.should have(1).errors_on(:option)
  end

  it "length must be atleat 4" do
    survey = Survey.create(name: "survey 123", year: "2234")
    question = Question.create(desc: "quwfjfgjhfgh", survey_id: survey.id)
    option = question.options.create(desc: "opti")
    option.should have(1).errors_on(:desc)
  end


end
