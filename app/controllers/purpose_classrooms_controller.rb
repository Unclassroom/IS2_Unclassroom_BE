class PurposeClassroomsController < ApplicationController
  before_action :set_purpose_classroom, only: [:show, :update, :destroy]

  # GET /purpose_classrooms
  def index
    @purpose_classrooms = PurposeClassroom.paginate(:page => params[:page], per_page: 2)

    render json: @purpose_classrooms
  end

  # GET /purpose_classrooms/1
  def show
    render json: @purpose_classroom
  end

  # POST /purpose_classrooms
  def create
    @purpose_classroom = PurposeClassroom.new(purpose_classroom_params)

    if @purpose_classroom.save
      render json: @purpose_classroom, status: :created, location: @purpose_classroom
    else
      render json: @purpose_classroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purpose_classrooms/1
  def update
    if @purpose_classroom.update(purpose_classroom_params)
      render json: @purpose_classroom
    else
      render json: @purpose_classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purpose_classrooms/1
  def destroy
    @purpose_classroom.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purpose_classroom
      @purpose_classroom = PurposeClassroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purpose_classroom_params
      params.require(:purpose_classroom).permit(:name)
    end
end
