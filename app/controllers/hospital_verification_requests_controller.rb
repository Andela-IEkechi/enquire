class HospitalVerificationRequestsController < ApplicationController
  before_action :set_hospital_verification_request, only: [:show, :edit, :update, :destroy]

  # GET /hospital_verification_requests
  # GET /hospital_verification_requests.json
  def index
    @hospital_verification_requests = HospitalVerificationRequest.all
  end

  # GET /hospital_verification_requests/1
  # GET /hospital_verification_requests/1.json
  def show
  end

  # GET /hospital_verification_requests/new
  def new
    @hospital_verification_request = HospitalVerificationRequest.new
  end

  # GET /hospital_verification_requests/1/edit
  def edit
  end

  # POST /hospital_verification_requests
  # POST /hospital_verification_requests.json
  def create
    @hospital_verification_request = HospitalVerificationRequest.new(hospital_verification_request_params)
    @hospital_verification_request.user = current_user

    respond_to do |format|
      if @hospital_verification_request.save
        format.html { redirect_to @hospital_verification_request, notice: 'Hospital verification request was successfully created.' }
        format.json { render :show, status: :created, location: @hospital_verification_request }
      else
        format.html { render :new }
        format.json { render json: @hospital_verification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospital_verification_requests/1
  # PATCH/PUT /hospital_verification_requests/1.json
  def update
    respond_to do |format|
      if @hospital_verification_request.update(hospital_verification_request_params)
        format.html { redirect_to @hospital_verification_request, notice: 'Hospital verification request was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital_verification_request }
      else
        format.html { render :edit }
        format.json { render json: @hospital_verification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_verification_requests/1
  # DELETE /hospital_verification_requests/1.json
  def destroy
    @hospital_verification_request.destroy
    respond_to do |format|
      format.html { redirect_to hospital_verification_requests_url, notice: 'Hospital verification was successful.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_verification_request
      @hospital_verification_request = HospitalVerificationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_verification_request_params
      params.require(:hospital_verification_request).permit(:user_id, :hospital_id, :message)
    end
end
