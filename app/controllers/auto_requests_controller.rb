class AutoRequestsController < ApplicationController
  before_action :set_auto_request, only: [:show, :update, :destroy]

  # GET /auto_requests
  def index
    @auto_requests = AutoRequest.all

    render json: @auto_requests
  end

  # GET /auto_requests/1
  def show
    render json: @auto_request
  end

  # POST /auto_requests
  def create
    @auto_request = AutoRequest.new(auto_request_params)

    if @auto_request.save
      @auto_request.addDataFromExcel
      #render json: @auto_request, status: :created, location: @auto_request
      redirect_back fallback_location: "http://localhost:4200/layout/loadrequest"
      #redirect_to "http://www.rubyonrails.org", alert: "Watch it, mister!"
    else
      render json: @auto_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auto_requests/1
  def update
    if @auto_request.update(auto_request_params)
      render json: @auto_request
    else
      render json: @auto_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auto_requests/1
  def destroy
    #@auto_request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_request
      @auto_request = AutoRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def auto_request_params
      params.permit(:file)
    end
end
