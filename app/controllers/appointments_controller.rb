class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment= Appointment.new
  end

  def create
    @appointment=Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: "Appointment scheduled successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: "Appointment updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointment_path, notice: "Appointment Cancelled!"
  end

  private

  def set_appointment
    @appointment=Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date,:user_id,:client_id)
  end
end
