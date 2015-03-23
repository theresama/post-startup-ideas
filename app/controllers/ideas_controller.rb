class IdeasController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :like, :dislike]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag])
    elsif params[:industry]
      @ideas = Idea.where(industry: params[:industry])
    else
      @ideas = Idea.all
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.build(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def like
    @idea = Idea.find(params[:id])
    @idea.liked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { likecount: @idea.get_likes.size, dislikecount: @idea.get_dislikes.size } }
      format.js { render :layout => false }
    end
  end

  def dislike
    @idea = Idea.find(params[:id])
    @idea.disliked_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { likecount: @idea.get_likes.size, dislikecount: @idea.get_dislikes.size } }
      format.js { render :layout => false }
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :industry, :keyword_list)
    end
end
