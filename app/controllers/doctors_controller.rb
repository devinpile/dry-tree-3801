class DoctorsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doctor = Doctor.find(params[:id])
    @patients = Patient.all
  end
end