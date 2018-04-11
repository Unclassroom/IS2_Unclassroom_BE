class HeadBuildingsController < ApplicationController
  before_action :set_head_building, only: [:show, :update, :destroy]

  # GET /head_buildings
  def index
    info = Array.new
    for i in HeadBuilding.all
      tmp = Hash.new
      tmp["Buildings"]=HeadBuilding.get_data(i.id)
      info.push(tmp)
    end
    render json: info
    # @head_buildings = HeadBuilding.all
    # render json: HeadBuilding.all
  end

  # GET /head_buildings/1
  def show
    #@hb_more = HeadBuilding.joins(:Building, :Department, :Faculty )
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
