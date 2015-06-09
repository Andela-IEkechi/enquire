class DashboardsController < ApplicationController
  def show
    @admin_notifications = HospitalVerificationRequest.all
    @doctor_notifications = DoctorVerificationRequest.all
  end
end
