class QuestionsController < ApplicationController
  autocomplete :tag, :name
  autocomplete :question, :body
  before_action :set_question, only: [:show, :update, :destroy, :answer]
  before_action :set_answers, only: [:show, :answer]
  load_and_authorize_resource

  # GET /questions
  # GET /questions.json
  def index
    if current_user.interests
      @interest_questions = Question.tagged_with(current_user.interests) #todo how are interests compiled?
    end
    if params[:q]
      @questions = Question.contains_text("%#{params[:q]}%").order('created_at DESC')
    else
      @questions = Question.all.order('created_at DESC')
    end
    @my_questions = current_user.questions.order('created_at DESC')
    @my_follows = current_user.followed_questions.order('created_at DESC')
    @interests = "" #todo how are interests compiled?
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = @question.answers.new
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @question = current_user.questions.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def answer
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully posted.' }
      else
        format.html { render :show }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_answers
      @answers = @question.answers.order('created_at desc')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:caption, :body, :user_id, :doctor_id, :all_tags)
    end

    def answer_params
      params.require(:answer).permit(:question_id, :content, :doctor_id)
    end
end
