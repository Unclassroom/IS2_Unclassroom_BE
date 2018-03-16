class DeparmentsController < ApplicationController
  before_action :set_deparment, only: [:show, :update, :destroy]

  # GET /deparments
  def index
    @deparments = Deparment.all

    render json: @deparments
  end

  # GET /deparments/1
  def show
    render json: @deparment
  end

  # POST /deparments
  def create
    @deparment = Deparment.new(deparment_params)

    if @deparment.save
      render json: @deparment, status: :created, location: @deparment
    else
      render json: @deparment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deparments/1
  def update
    if @deparment.update(deparment_params)
      render json: @deparment
    else
      render json: @deparment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deparments/1
  def destroy
    @deparment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deparment
      @deparment = Deparment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deparment_params
      params.require(:deparment).permit(:faculty_id, :name, :teacher_id)
    end
end
