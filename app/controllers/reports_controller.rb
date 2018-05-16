class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /reports
  def index
    @reports = Report.all
    render json: @reports
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = Report.new(report_params)
    
    case params[:user_type]
    when "student"
      Student.find(params[:user_id]).reports << @report
    when "head_building"
      HeadBuilding.find(params[:user_id]).reports << @report
    when "teacher"
      Teacher.find(params[:user_id]).reports << @report
    when "external_person"
      ExternalPerson.find(params[:user_id]).reports << @report
    when "manager"
      Manager.find(params[:user_id]).reports << @report
    else
      render json: ["invalid user type:", params[:user_type]]
      return -1
    end


    
    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.permit(:description, :classroom_id, :image)
    end
end
