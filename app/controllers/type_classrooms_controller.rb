class TypeClassroomsController < ApplicationController
  before_action :set_type_classroom, only: [:show, :update, :destroy]

  # GET /type_classrooms
  def index_no_paginate
    @type_classrooms = TypeClassroom.all

    render json: @type_classrooms
  end

  def index
    @type_classrooms = TypeClassroom.paginate(:page => params[:page], per_page: 10).order('created_at DESC')

    render json: @type_classrooms
  end

  # GET /type_classrooms/1
  def show
    render json: @type_classroom
  end

  # POST /type_classrooms
  def create
    @type_classroom = TypeClassroom.new(type_classroom_params)

    if @type_classroom.save
      render json: @type_classroom, status: :created, location: @type_classroom
    else
      render json: @type_classroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_classrooms/1
  def update
    if @type_classroom.update(type_classroom_params)
      render json: @type_classroom
    else
      render json: @type_classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_classrooms/1
  def destroy
    #@type_classroom.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_classroom
      @type_classroom = TypeClassroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_classroom_params
      params.require(:type_classroom).permit(:name)
    end
end
