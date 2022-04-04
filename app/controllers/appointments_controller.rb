class AppointmentsController < ApplicationController
  before_action :appointment_create_access, only: [:create]

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to index_path
    else
      render 'appointments/new'
    end
  end

  def index
    if doctor_signed_in?
      @appointments = Appointment.where(doctor_id: current_user.id)
    else
      @appointments = Appointment.where(patient_id: current_user.id)
    end
  end

  def appointment_create_access
    redirect_to appointments_path	if doctor_signed_in?
  end

  private
  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :date, :hour)
  end
end
