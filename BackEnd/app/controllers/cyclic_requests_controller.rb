class CyclicRequestsController < ApplicationController
  before_action :set_cyclic_request, only: [:show, :update, :destroy]

  # GET /cyclic_requests
  def index
    @cyclic_requests = CyclicRequest.all

    render json: @cyclic_requests
  end

  # GET /cyclic_requests/1
  def show
    render json: @cyclic_request
  end

  # POST /cyclic_requests
  def create
    @cyclic_request = CyclicRequest.new(cyclic_request_params)

    if @cyclic_request.save
      render json: @cyclic_request, status: :created, location: @cyclic_request
    else
      render json: @cyclic_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cyclic_requests/1
  def update
    if @cyclic_request.update(cyclic_request_params)
      render json: @cyclic_request
    else
      render json: @cyclic_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cyclic_requests/1
  def destroy
    @cyclic_request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cyclic_request
      @cyclic_request = CyclicRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cyclic_request_params
      params.require(:cyclic_request).permit(:request_alternative_id, :cyclic_schedule_id)
    end
end
