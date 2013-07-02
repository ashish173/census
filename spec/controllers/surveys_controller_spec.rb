require 'spec_helper'

describe SurveysController do

  let(:question_editing) { Survey.last  }

  it "respond with 200 st" do
    survey = Survey.create(name: "ashis", year: "2313")
    get :index
    expect(response).to render_template :index # render template
    expect(assigns(:surveys)).to eq([survey])
  end

  it "Get new" do
    Survey.create(name: "ashish", year: "1233")
    get :new

    expect(assigns(:surveys).new_record?).to eq(true)
    expect(assigns(:surveys)).to be_a_new(Survey)  #new record
    #expect(response).to render_template :new  # checks template 
    
  end

  it "create a new survey" do
    post :create, :survey => {name: "ashishsh", year: "1233"}
    #expect{ 
    #post :create, :survey =>  {name: "ashish", year: "1233" }}.to change(Survey, :count).by(1)
    #expect(assigns(:survey)).to change(Survey, :count).by(1)
    expect(assigns(:surveys).valid?).to eq(true)
    # expect(response).to render_template :index
   
  end

  it "should not create survey fo wrong attributes are passed" do
    post :create, :survey => {}
    expect(assigns(:surveys).valid?).to eq(false) # works with validations
    expect(assigns(:surveys)).to render_template :new

  end

  it "should take questions with the survey" do
    post :create, :survey => { name: "ashsi", year: "1233", :questions_attributes => {:"1" => {:desc => "Question 1"},
                   :"2" => {:desc => "Question 2"}, 
                   :"3" => {:desc => "Question 3"}}}

    expect(assigns(:surveys).valid?).to eq(true)
  end
  # should check it not right
  it "should accept questions without options" do
    post :create, :survey => {name: "survey3", year: "1243",
      :questions_attributes => { :"1" => {:desc => "question 1", 
        :options_attributes => {:"1" => {:desc => "option 1"}, :"2" => {:desc => "option 2"}}}}}
                    
    expect(assigns(:surveys).valid?).to eq(true)
  end
  
  ##### Edit the questions ########
  it "update the survey name" do
    # create a survey, add questions, and then rename the question name using the id of the 
    s_id = Survey.create(name: "asthish", year: "2113")
    post :update, id: s_id.id, :survey => {name: "changed", year: "3112"}
    expect(Survey.find(s_id.id).name).to eq("changed")
    expect(response).to redirect_to action: "index"
  end

  ##### delete question ####
  # DELETE 
  it "delete question" do
    s_id = Survey.create(name: "survey 1", year: "2013") 
    delete :destroy, id: s_id
    #expect(assigns(:surveys)).count.to change.by(-1)
    expect(response).to redirect_to action: "index"
  end

  it "shows the details of a survey" do
    s_id = Survey.create(name: "survey 2", year: "2133").id
    get :show, id: s_id
    expect(Survey.find(s_id).name).to eq("survey 2")
  end
=begin 
  it "update the question " do
    s_id = Survey.create(name: "survey real one", year: "2129")
    q_id = s_id.questions.create(desc: "Question 1")
    q_id.options.create(desc: "option 1")
    post :update, id: s_id, :survey => { name: "survey changed", year: "2113", :questions_attributes => {:"1" => {desc: "Question changed" , :options_attributes => {:"1" => {desc: "option changed"}}}}}
    expect(Survey.find(s_id).questions.find(q_id).desc).to eq("Question changed")
    
  end
=end

end

=begin
"assigns" is a helper method that helps in assigning the vars from controller to the specs
=end
