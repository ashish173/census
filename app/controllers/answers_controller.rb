class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  
  


  def show
    @answer = Answer.find(params[:id])
    if @answer.valid?
      render action: "show"
    else
      p 'not your day'
    end
  end  
  
  def create
    #@answer = Answer.new(params[:id])
    #p @answer
    @p = params[:desc]
    @p.each do |key, value|
      Answer.create(user_id: current_user.id, survey_id: key , option_id: value)
    end
    #if @answer.save
     # redirect_to surveys_path
    #else
      #p "could not save"
      #render action: "show"
    #end
  end

end

