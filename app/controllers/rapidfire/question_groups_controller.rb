module Rapidfire
  class QuestionGroupsController < Rapidfire::ApplicationController
    before_filter :authenticate_administrator!, except: :index
    # respond_to :html, :js
    # respond_to :json, only: :results
    include ApplicationHelper
    
    def index
      @posts = QuestionGroup.order('created_at DESC').paginate :page => params[:page]
      @my_question_groups= QuestionGroup.where(:user_id => current_user.id)
      @question_groups = QuestionGroup.all.reverse
      respond_with(@question_groups)
    end
    
    
    def new
      @question_group = QuestionGroup.new
      respond_with(@question_group)
    end
    
    def create
      @userinfo = User.find_by_id(current_user.id)
      @userinfo.point -= 10
      @userinfo.postnum += 1
      @userinfo.save
  
      @question_group = QuestionGroup.new(question_group_params)
      # @question_group.user_id = current_user.id
      # # @question_group.writer = current_user.username
      # @question_group.save
      # respond_with(@question_group, location: question_group_questions_path(@question_group))
      
      if @question_group.save
        respond_to do |format|
          format.html { redirect_to question_group_questions_path(@question_group) }
          format.js
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.js
        end
      end
      
    end
    
    def show
      redirect_to "/rapidfire"
    # doesn't need to assign the flash notice to the template, that's done automatically
    end
    
    def destroy
      @question_group = QuestionGroup.find(params[:id])
      @question_group.destroy
      
      # respond_with(@question_group)
      
      respond_to do |format|
        format.html { redirect_to question_group_path }
        format.js
      end
    end
    
    def results
      @question_group = QuestionGroup.find(params[:id])
      @question_group_results =
        QuestionGroupResults.new(question_group: @question_group).extract
      # respond_with(@question_group_results, root: false)
      
      respond_to do |format|
        format.json { render json: @question_group_results, root: false }
        format.html
        format.js
      end
    end
    
    
    private
    def question_group_params
      if Rails::VERSION::MAJOR == 4
        params.require(:question_group).permit(:user_id, :name, :writer)
      else
        params[:question_group]
      end
    end
  end
end