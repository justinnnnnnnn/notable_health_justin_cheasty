class AppointmentsController < ApplicationController
  def create
    if Appointment.valid?(params[:appt_input_in_epoch], appt_params[:appointment][:doctor_id])
      @appointment = Appointment.new(appt_params)
    else
      return flash[:errors] = ['Invalid appointment time.']
    end
    unless @appointment.save
      flash[:errors] = @appointment.errors.full_messages
    end
    render json: @appointment
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment
      @appointment.delete
    end
  end

  private
  def appt_params
    params.require(:appointment).permit(
      :patient_first_name, 
      :patient_last_name,
      :kind,
      :appt_date,
      :appt_time,
      :doctor_id
    )
  end
end
