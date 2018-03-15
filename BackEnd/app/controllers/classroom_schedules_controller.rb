class ClassroomSchedulesController < ApplicationController
  before_action :set_classroom_schedule, only: [:show, :update, :destroy]

  # GET /classroom_schedules
  def index
    @classroom_schedules = ClassroomSchedule.all

    render json: @classroom_schedules
  end

  # GET /classroom_schedules/1
  def show
    render json: @classroom_schedule
  end

  # POST /classroom_schedules
  def create
    @classroom_schedule = ClassroomSchedule.new(classroom_schedule_params)

    if @classroom_schedule.save
      render json: @classroom_schedule, status: :created, location: @classroom_schedule
    else
      render json: @classroom_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classroom_schedules/1
  def update
    if @classroom_schedule.update(classroom_schedule_params)
      render json: @classroom_schedule
    else
      render json: @classroom_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classroom_schedules/1
  def destroy
    @classroom_schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_schedule
      @classroom_schedule = ClassroomSchedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_schedule_params
      params.require(:classroom_schedule).permit(:classroom_id, :group_id, :cyclic_schedule_id)
    end
end
