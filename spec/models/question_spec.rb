require 'spec_helper'

describe Question do
  it "same description should be invalid" do
    question1 = Question.create(desc:"dsifjidsfsd")
    question2 = Question.create(desc:"dsifjidsfsd")
    question2.should_not be_valid
  end

  it "must have description" do
    question = Question.create()
    question.should have(2).errors_on(:desc)
  end

  it "must have a survey" do
    #survey = Survey.create(name: "ashjishh", year: "1234")
    question = Question.create(desc: "question sasd1")
    question.should have(1).errors_on(:survey_id)

  end

  it "length must be more than 8 chars" do
    question = Question.create(desc: "Q-> 1")
    question.should have(1).errors_on(:desc)
  end

end
