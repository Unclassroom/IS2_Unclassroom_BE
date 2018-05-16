class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  def index
    @requests = Request.paginate(:page => params[:page], per_page: 10)
    render json: @requests
  end

  def index_no_paginate
    @requests = Request.all
    render json: @requests
  end

  def number_pages
    pages = Request.all.count
    render json: (pages/10).ceil
  end


  # GET /requests/1
  def show
    render json: @request    
  end

  def get_pdf
    respond_to do |format|
      # format.html
      @request = Request.find(params[:id])
      format.json {render json: params[:id] }
      format.pdf { render template: "generated/gen", pdf: 'request' }
    end
  end

  # POST /requests
  def create

    user = nil
    case params[:user_type]
    when "student"
      user = Student.find(params[:user_id])
    when "head_building"
      user = HeadBuilding.find(params[:user_id])
    when "teacher"
      user = Teacher.find(params[:user_id])
    when "external_person"
      user = ExternalPerson.find(params[:user_id])
    when "manager"
      user = Manager.find(params[:user_id])
    else
      render json: ["invalid user type:", params[:user_type]]
      return -1
    end

    @request = Request.new(request_params)
    if @request.save
        user.requests << @request
        for i in params[:alternatives]
          ra = RequestAlternative.create!(request_id: @request.id)
          @tr = i[:type_request]
          if  @tr == "specific"
            sr = SpecificRequest.create!(request_alternative_id: ra.id)
            ra.specific_requests << sr
            for j in i[:specific]
              sy = SpecificSchedule.create!(
                begin_at_hour: j[:begin_at_hour],
                begin_at_minute: j[:begin_at_minute],
                end_at_hour: j[:end_at_hour],
                end_at_minute: j[:end_at_minute],
                date: j[:date]
                )
                sr.specific_schedule << sy
            end
            ra.specific_requests << sr 
          elsif @tr == "cyclic"
            cr = CyclicRequest.create!(request_alternative_id: ra.id)
            ra.cyclic_requests << cr
            for j in i[:cyclic]
              cy = CyclicSchedule.create!(
                begin_at_hour: j[:begin_at_hour],
                begin_at_minute: j[:begin_at_minute],
                end_at_hour: j[:end_at_hour],
                end_at_minute: j[:end_at_minute],
                day: j[:day]
                )
                cr.cyclic_schedule << cy
            end
            ra.cyclic_requests << cr
          end
          @request.request_alternatives << ra

        end
        # render json: {msg: @tr}
      render json: @request, status: :created, location: @request
      #redirect_to "localhost:4200/layout/request/register"
      #RequestMailer.new_request(@request).deliver_later
      # I dont want the account blocked, so this line is commented unless it's in production.
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  def count_by_purpose
    data = Array.new
    ans = Request.get_between_dates_by_purpose(params[:begin_date],params[:end_date])
    render json: ans
  end

  def count_by_month
    data = Array.new
    ans = Request.get_between_dates_by_month(params[:begin_date],params[:end_date])
    render json: ans
  end

  def count_by_state
    data = Array.new
    ans = Request.get_between_dates_by_state(params[:begin_date],params[:end_date])
    render json: ans
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.permit(:purpose_classroom_id, :type_classroom_id, :state, 
      :accepted_alternative, :file, :motive, :alternatives)
    end

    
end