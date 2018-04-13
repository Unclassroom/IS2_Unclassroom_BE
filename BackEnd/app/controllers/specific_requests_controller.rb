class SpecificRequestsController < ApplicationController
  before_action :set_specific_request, only: [:show, :update, :destroy]

  # GET /specific_requests
  def index
    @specific_requests = SpecificRequest.all
    render json: @specific_requests
  end

  # GET /specific_requests/1
  def show
    render json: @specific_request
  end

  # POST /specific_requests
  def create
    @specific_request = SpecificRequest.new(specific_request_params)

    if @specific_request.save
      render json: @specific_request, status: :created, location: @specific_request
    else
      render json: @specific_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specific_requests/1
  def update
    if @specific_request.update(specific_request_params)
      render json: @specific_request
    else
      render json: @specific_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specific_requests/1
  def destroy
    @specific_request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_request
      @specific_request = SpecificRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def specific_request_params
      params.require(:specific_request).permit(:request_alternative_id, :specific_id)
    end
end
