class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :update, :destroy]

  # GET /opinions
  def index
    @opinions = Opinion.all
    render json: @opinions
  end

  # GET /opinions/1
  def show
    render json: @opinion
  end

  # POST /opinions
  def create
    @opinion = Opinion.new(opinion_params)
    case params[:user_type]
    when "student"
      Student.find(params[:user_id]).opinions << @opinion
    when "head_building"
      HeadBuilding.find(params[:user_id]).opinions << @opinion
    when "teacher"
      Teacher.find(params[:user_id]).opinions << @opinion
    when "external_person"
      ExternalPerson.find(params[:user_id]).opinions << @opinion
    when "manager"
      Manager.find(params[:user_id]).opinions << @opinion
    else
      render json: ["invalid user type:", params[:user_type]]
      return -1
    end

    if @opinion.save
      render json: @opinion, status: :created, location: @opinion
    else
      render json: @opinion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /opinions/1
  def update
    if @opinion.update(opinion_params)
      render json: @opinion
    else
      render json: @opinion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /opinions/1
  def destroy
    @opinion.destroy
  end

  private
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    def opinion_params
      params.permit(:classroom_id, :description, :image)
    end
end
