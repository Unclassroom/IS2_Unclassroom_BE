class ExternalPeopleController < ApplicationController
  before_action :set_external_person, only: [:show, :update, :destroy]

  # GET /external_people
  def index
    @external_people = ExternalPerson.all

    render json: @external_people
  end

  # GET /external_people/1
  def show
    render json: @external_person
  end

  # POST /external_people
  def create
    @external_person = ExternalPerson.new(external_person_params)

    if @external_person.save
      render json: @external_person, status: :created, location: @external_person
    else
      render json: @external_person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /external_people/1
  def update
    if @external_person.update(external_person_params)
      render json: @external_person
    else
      render json: @external_person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /external_people/1
  def destroy
    @external_person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_person
      @external_person = ExternalPerson.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def external_person_params
      params.require(:external_person).permit(:cc, :first_name, :last_name, :email)
    end
end
