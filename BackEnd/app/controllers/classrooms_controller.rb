class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :update, :destroy]

  # GET /classrooms
  def index
    info = Array.new
    for i in Classroom.all
      tmp = Hash.new
      tmp["Data"]=Classroom.get_data(i.id)
      info.push(tmp)
    end
    render json: info
    # @classrooms = Classroom.all
    # render json: @classrooms
  end

  # GET /classrooms/1
  def show
    @classrooms = Classroom.all
    render json: @classroom
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
