class SpecificSchedulesController < ApplicationController
  before_action :set_specific_schedule, only: [:show, :update, :destroy]

  # GET /specific_schedules
  def index
    @specific_schedules = SpecificSchedule.all

    render json: @specific_schedules
  end

  # GET /specific_schedules/1
  def show
    render json: @specific_schedule
  end

  def available_classrooms
    render json: SpecificSchedule.available_classrooms(params[:ini_date], params[:end_date])
  end

  # POST /specific_schedules
  def create
    @specific_schedule = SpecificSchedule.new(specific_schedule_params)

    if @specific_schedule.save
      render json: @specific_schedule, status: :created, location: @specific_schedule
    else
      render json: @specific_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specific_schedules/1
  def update
    if @specific_schedule.update(specific_schedule_params)
      render json: @specific_schedule
    else
      render json: @specific_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specific_schedules/1
  def destroy
    @specific_schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_schedule
      @specific_schedule = SpecificSchedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def specific_schedule_params
      params.require(:specific_schedule).permit(:day, :begin_at, :end_at)
    end
end
