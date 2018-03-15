class SpecificsController < ApplicationController
  before_action :set_specific, only: [:show, :update, :destroy]

  # GET /specifics
  def index
    @specifics = Specific.all

    render json: @specifics
  end

  # GET /specifics/1
  def show
    render json: @specific
  end

  # POST /specifics
  def create
    @specific = Specific.new(specific_params)

    if @specific.save
      render json: @specific, status: :created, location: @specific
    else
      render json: @specific.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specifics/1
  def update
    if @specific.update(specific_params)
      render json: @specific
    else
      render json: @specific.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specifics/1
  def destroy
    @specific.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific
      @specific = Specific.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def specific_params
      params.require(:specific).permit(:date, :begin_at, :end_at)
    end
end
