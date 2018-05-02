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
      # render json: @request, status: :created, location: @request
      redirect_to "localhost:4200/layout/request/register"
      RequestMailer.new_request(@request).deliver_later
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
        :type_classroom_id, :state, :accepted_alternative, :file, :motive)
    end

    
end