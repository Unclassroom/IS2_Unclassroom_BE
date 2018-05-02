class CyclicSchedulesController < ApplicationController
  before_action :set_cyclic_schedule, only: [:show, :update, :destroy]

  # GET /cyclic_schedules
  def index
    @cyclic_schedules = CyclicSchedule.all
    render json: @cyclic_schedules
  end

  # GET /cyclic_schedules/1
  def show
    render json: @cyclic_schedule
  end

  # POST /cyclic_schedules
  def create
    @cyclic_schedule = CyclicSchedule.new(cyclic_schedule_params)

    if @cyclic_schedule.save
      render json: @cyclic_schedule, status: :created, location: @cyclic_schedule
    else
      render json: @cyclic_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cyclic_schedules/1
  def update
    if @cyclic_schedule.update(cyclic_schedule_params)
      render json: @cyclic_schedule
    else
      render json: @cyclic_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cyclic_schedules/1
  def destroy
    @cyclic_schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cyclic_schedule
      @cyclic_schedule = CyclicSchedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cyclic_schedule_params
      params.require(:cyclic_schedule).permit(:day, :begin_at, :end_at)
    end
end
