require 'spec_helper'

describe AnswersController do

  describe "GET the survey results" do
    it "returns http success" do
      get :index
      expect(response).to render_template :index
    end
    
    it "creates the answers " do
      a = Answer.create(survey_id: 36 , user_id: 2, option_id: 46)
      get :show, id: a
      expect(assigns(:answer).valid?).to eq(true)
      expect(response).to render_template :show
    end
  end



end
