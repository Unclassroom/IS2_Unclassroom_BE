class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.paginate(:page => params[:page], per_page: 10).order('created_at DESC')

    render json: @subjects
  end

  def index_no_paginate
    @subjects = Subject.all

    render json: @subjects
  end

  def number_pages
    pages = Subject .all.count
    render json: (pages/10).ceil
  end


  # GET /subjects/1
  def show
    render json: @subject
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      render json: @subject, status: :created, location: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
