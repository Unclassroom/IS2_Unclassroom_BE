class RequestAlternativesController < ApplicationController
  before_action :set_request_alternative, only: [:show, :update, :destroy]

  # GET /request_alternatives
  def index
    @request_alternatives = RequestAlternative.all

    render json: @request_alternatives
  end

  # GET /request_alternatives/1
  def show
    render json: @request_alternative
  end

  # POST /request_alternatives
  def create
    @request_alternative = RequestAlternative.new(request_alternative_params)

    if @request_alternative.save
      render json: @request_alternative, status: :created, location: @request_alternative
    else
      render json: @request_alternative.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /request_alternatives/1
  def update
    if @request_alternative.update(request_alternative_params)
      render json: @request_alternative
    else
      render json: @request_alternative.errors, status: :unprocessable_entity
    end
  end

  # DELETE /request_alternatives/1
  def destroy
    @request_alternative.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_alternative
      @request_alternative = RequestAlternative.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_alternative_params
      params.require(:request_alternative).permit(:request_id)
    end
end
