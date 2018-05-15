class ClassroomsController < ApplicationController
  include ActiveModel::Serializers::JSON
  before_action :set_classroom, only: [:show, :update, :destroy]

  # GET /classrooms
  def index
    @classrooms = Classroom.all
    render json: @classrooms
  end


  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      render json: @classroom, status: :created, location: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # GET /classrooms/1
  def show
    render json: @classroom
  end

  # GET /classrooms/1
  def taken_schedules
    render json: Classroom.find(params[:id]).taken_schedules(params[:ini], params[:fin])
  end


  # PATCH/PUT /classrooms/1
  def update
    if @classroom.update(classroom_params)
      render json: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_params
      params.require(:classroom).permit(:type_classroom_id, :building_id, :department_id, :capacity)
    end
end
