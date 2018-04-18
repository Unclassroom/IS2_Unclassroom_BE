class BuildingsController < ApplicationController
  # before_action :authenticate_user,  only: [:index]
  # before_action :authenticate_user,  only: [:auth]
  # before_action :set_building, only: [:show, :update, :destroy]

  # GET /buildings
  def index
    # info = Array.new
    # for i in Building.all
    #   tmp = Hash.new
    #   tmp["Build"]=Building.get_classroms(i.id)
    #   info.push(tmp)
    # end
    # render json: info
    @building = Building.all
    render json: @building
  end

  # GET /buildings/1
  def show
    render json: @building
  end

  # POST /buildings
  def create
    @building = Building.new(building_params)

    if @building.save
      render json: @building, status: :created, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buildings/1
  def update
    if @building.update(building_params)
      render json: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buildings/1
  def destroy
    @building.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def building_params
      params.require(:building).permit(:head_building_id, :faculty_id, :name)
    end
end
