class ClassroomEventsController < ApplicationController
  before_action :set_classroom_event, only: [:show, :update, :destroy]

  # GET /classroom_events
  def index
    
    @classroom_events = ClassroomEvent.all
    render json: @classroom_events
  end

  # GET /classroom_events/1
  def show
    render json: @classroom_event
  end

  # POST /classroom_events
  def create
    @classroom_event = ClassroomEvent.new(classroom_event_params)

    if @classroom_event.save
      render json: @classroom_event, status: :created, location: @classroom_event
    else
      render json: @classroom_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classroom_events/1
  def update
    if @classroom_event.update(classroom_event_params)
      render json: @classroom_event
    else
      render json: @classroom_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classroom_events/1
  def destroy
    @classroom_event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_event
      @classroom_event = ClassroomEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_event_params
      params.require(:classroom_event).permit(:event_id, :specific_id, :classroom_id)
    end
end
