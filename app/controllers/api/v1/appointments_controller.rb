class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :receipt]

  # GET /appointments?start_time=datetime&end_time=datetime
  def index
    if params[:start_time] && params[:end_time]
      @appointments =
        Appointment.between(params[:start_time], params[:end_time])
    else
      @appointments = Appointment.all
    end

    render json: @appointments
  end

  # GET /appointments/1?receipt=true
  def show
    @appointment.includes(:receipt) if params[:receipt]
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created, location: api_v1_appointment_url(@appointment)
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  # def destroy
  #   @appointment.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:start_time, :end_time, :user_id, :status)
    end
end
