class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  def index
    @requests = Request.all
    render json: @requests
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
    @request = Request.new(request_params)
    if @request.save
        for i in params[:alternatives]
          ra = RequestAlternative.create!(request_id: @request.id)
          @tr = params[:type_request]
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
          elsif params[:type_request] == "cyclic"
            render json: {msg: 'cyclic'}
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
          else
            # render json: {msg: 'empty type'}
          end
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
      params.permit(:teacher_id, :external_person_id, :purpose_classroom_id, 
        :type_classroom_id, :state, :accepted_alternative, :file, :motive, :alternatives)
    end

    
end