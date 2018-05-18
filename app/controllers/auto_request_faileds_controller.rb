class AutoRequestFailedsController < ApplicationController
  before_action :set_auto_request_failed, only: [:show, :update, :destroy]

  # GET /auto_request_faileds
  def index
    @auto_request_faileds = AutoRequestFailed.all

    render json: @auto_request_faileds
  end

  # GET /auto_request_faileds/1
  def show
    render json: @auto_request_failed
  end

  # POST /auto_request_faileds
  def create
    @auto_request_failed = AutoRequestFailed.new(auto_request_failed_params)

    if @auto_request_failed.save
      render json: @auto_request_failed, status: :created, location: @auto_request_failed
    else
      render json: @auto_request_failed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auto_request_faileds/1
  def update
    if @auto_request_failed.update(auto_request_failed_params)
      render json: @auto_request_failed
    else
      render json: @auto_request_failed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auto_request_faileds/1
  def destroy
    #@auto_request_failed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_request_failed
      @auto_request_failed = AutoRequestFailed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def auto_request_failed_params
      params.require(:auto_request_failed).permit(:auto_request_id, :code, :group, :day, :time, :building, :classroom)
    end
end
