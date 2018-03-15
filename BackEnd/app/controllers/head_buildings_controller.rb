class HeadBuildingsController < ApplicationController
  before_action :set_head_building, only: [:show, :update, :destroy]

  # GET /head_buildings
  def index
    @head_buildings = HeadBuilding.all

    render json: @head_buildings
  end

  # GET /head_buildings/1
  def show
    render json: @head_building
  end

  # POST /head_buildings
  def create
    @head_building = HeadBuilding.new(head_building_params)

    if @head_building.save
      render json: @head_building, status: :created, location: @head_building
    else
      render json: @head_building.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /head_buildings/1
  def update
    if @head_building.update(head_building_params)
      render json: @head_building
    else
      render json: @head_building.errors, status: :unprocessable_entity
    end
  end

  # DELETE /head_buildings/1
  def destroy
    @head_building.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_head_building
      @head_building = HeadBuilding.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def head_building_params
      params.require(:head_building).permit(:cc, :first_name, :last_name, :email)
    end
end
