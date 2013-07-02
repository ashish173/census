class SurveysController < ApplicationController
  def index
    @surveys = Survey.all  
  end
  
  # disclaimer :=
    # the instance variable @surveys should be ideally @survey
    # as its single when used in new, create, edit methods.
    # next time keep in mind.

  def new
    @surveys = Survey.new
    3.times do
      @surveys.questions.build
      4.times do
        @surveys.questions.last.options.build
      end
    end
  end

  def create
    @surveys = Survey.new(params[:survey])
    if @surveys.save
      p "creation successful"
      redirect_to action: "index"
    else
      p "creation not successful"
      render action: "new"
   end
  end
  # GET with id 
  def edit 
    #p params[:id]
    @surveys = Survey.find(params[:id])
  end
  # PUT with id 
  def update
    @surveys = Survey.find(params[:id])
    if @surveys.update_attributes(params[:survey])
      p "updated succesfully"
      redirect_to action: "index"
    else
      p "Failed to edit Survey"
      render action: "edit"
    end
  end
  
  def destroy
    @surveys = Survey.find(params[:id])
    
    if @surveys.destroy
      p "succesfully deleted"
      redirect_to action: "index"
    else
      p "could not delete try good delete logic"
    end 
  end

  def show
    @survey = Survey.find(params[:id])
    if @survey
      p "got a matching object"
    else
      p "i don't know there is a problem with your database"
    end
  end
  

  # this function gets all the question of a survey and lets a 
  # user submit using radio buttons
  # This form submits to the answers controller(create) method
  def take_survey
    @survey = Survey.find(params[:id])
    p "this is survey taking method"
    

  end


end  
