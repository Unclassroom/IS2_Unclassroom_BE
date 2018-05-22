class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :update, :destroy]

  # GET /faculties
  def index
    @faculties = Faculty.paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    #must send http://localhost:3000/faculties?page={number}
    render json: @faculties
  end

  def number_pages
    pages = Faculty.all.count 
    render json: (pages/10.0).ceil
  end

  def index_no_paginate
    @faculties = Faculty.all
    render json: @faculties
  end

  # GET /faculties/1
  def show
    render json: @faculty
  end
  # GET /faculties/1
  def classrooms
    render json: Faculty.find(params[:id]).classrooms
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
   # @faculty.destroy
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
