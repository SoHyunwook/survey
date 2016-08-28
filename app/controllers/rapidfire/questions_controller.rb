module Rapidfire
  class QuestionsController < Rapidfire::ApplicationController
    before_filter :authenticate_administrator!
    respond_to :html, :js
    before_filter :find_question_group!
    before_filter :find_question!, :only => [:edit, :update, :destroy]
    
    def index
      @questions = @question_group.questions
      respond_with(@questions)
    end
    
    def new
      @question = QuestionForm.new(:question_group => @question_group)
      respond_with(@question)
    end
    
    def create
      form_params = params[:question].merge(:question_group => @question_group)
      @question = QuestionForm.new(form_params)
      @question.save
      respond_with(@question, location: index_location)
    end
    
    def edit
      @question = QuestionForm.new(:question => @question)
      @question_group_name = @question_group.name
      respond_with(@question)
    end
    
    def update
      form_params = params[:question].merge(:question => @question)
      @question = QuestionForm.new(form_params)
      @question.save
      respond_with(@question, location: index_location)
    end
    
    def destroy
      @question.destroy
      # respond_with(@question, location: index_location)
      respond_to do |format|
        format.html { redirect_to index_location }
        format.js
      end
    end
    
    private
    
    def save_and_redirect(params, on_error_key)
      @question_form = QuestionForm.new(params)
      @question_form.save

      if @question_form.errors.empty?
        respond_to do |format|
          format.html { redirect_to index_location }
          format.js
        end
      else
        respond_to do |format|
          format.html { render on_error_key.to_sym }
          format.js
        end
      end
    end
    
    def find_question_group!
      @question_group = QuestionGroup.find(params[:question_group_id])
    end
    
    def find_question!
      @question = @question_group.questions.find(params[:id])
    end
    
    def index_location
      rapidfire.question_group_questions_url(@question_group)
    end
  end
end