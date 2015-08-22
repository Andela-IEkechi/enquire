class DashboardsController < ApplicationController
  def show
    @admin_notifications = HospitalVerificationRequest.all
    @manager_notifications = DoctorVerificationRequest.all
  end
end
