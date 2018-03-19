class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :update, :destroy]

  # GET /faculties
  def index
    @faculties = Faculty.all

    render json: @faculties
  end

  # GET /faculties/1
  def show
    render json: @faculty
  end

  # POST /faculties
  def create
    @faculty = Faculty.new(faculty_params)

    if @faculty.save
      render json: @faculty, status: :created, location: @faculty
    else
      render json: @faculty.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /faculties/1
  def update
    if @faculty.update(faculty_params)
      render json: @faculty
    else
      render json: @faculty.errors, status: :unprocessable_entity
    end
  end

  # DELETE /faculties/1
  def destroy
    @faculty.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def faculty_params
      params.require(:faculty).permit(:name)
    end
end
