class DoctorVerificationRequestsController < ApplicationController
  before_action :set_doctor_verification_request, only: [:show, :edit, :update, :destroy]

  # GET /doctor_verification_requests
  # GET /doctor_verification_requests.json
  def index
    @doctor_verification_requests = DoctorVerificationRequest.all
  end

  # GET /doctor_verification_requests/1
  # GET /doctor_verification_requests/1.json
  def show
  end

  # GET /doctor_verification_requests/new
  def new
    @doctor_verification_request = DoctorVerificationRequest.new
  end

  # GET /doctor_verification_requests/1/edit
  def edit
  end

  # POST /doctor_verification_requests
  # POST /doctor_verification_requests.json
  def create
    @doctor_verification_request = DoctorVerificationRequest.new(doctor_verification_request_params)
    @doctor_verification_request.user = current_user

    respond_to do |format|
      if @doctor_verification_request.save
        NotificationMailer.doctor_verification_email(current_user, @doctor_verification_request.hospital.user).deliver_now
        format.html { redirect_to dashboard_path, notice: 'Doctor verification request was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_verification_request }
      else
        format.html { render :new }
        format.json { render json: @doctor_verification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctor_verification_requests/1
  # PATCH/PUT /doctor_verification_requests/1.json
  def update
    respond_to do |format|
      if @doctor_verification_request.update(doctor_verification_request_params)
        format.html { redirect_to @doctor_verification_request, notice: 'Doctor verification request was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor_verification_request }
      else
        format.html { render :edit }
        format.json { render json: @doctor_verification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_verification_requests/1
  # DELETE /doctor_verification_requests/1.json
  def destroy
    @doctor_verification_request.destroy
    NotificationMailer.doctor_verified(@doctor_verification_request.user, @doctor_verification_request.hospital.user).deliver_now
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Doctor verification was successful.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_verification_request
      @doctor_verification_request = DoctorVerificationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_verification_request_params
      params.require(:doctor_verification_request).permit(:user_id, :hospital_id, :message)
    end
end
