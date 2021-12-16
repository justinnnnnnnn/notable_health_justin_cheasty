class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
    render json: @doctor.to_json(include: [:appointments])
  end
end
