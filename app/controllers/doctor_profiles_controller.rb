class DoctorProfilesController < ApplicationController
  before_action :set_doctor_profile, only: [:show, :edit, :update, :destroy]

  # GET /doctor_profiles
  # GET /doctor_profiles.json
  def index
    @doctor_profiles = DoctorProfile.all
  end

  # GET /doctor_profiles/1
  # GET /doctor_profiles/1.json
  def show
  end

  # GET /doctor_profiles/new
  def new
    @doctor_profile = DoctorProfile.new
  end

  # GET /doctor_profiles/1/edit
  def edit
  end

  # POST /doctor_profiles
  # POST /doctor_profiles.json
  def create
    @doctor_profile = DoctorProfile.new(doctor_profile_params)
    @doctor_profile.doctor = current_doctor

    respond_to do |format|
      if @doctor_profile.save
        format.html { redirect_to @doctor_profile, notice: 'Doctor profile was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_profile }
      else
        format.html { render :new }
        format.json { render json: @doctor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctor_profiles/1
  # PATCH/PUT /doctor_profiles/1.json
  def update
    respond_to do |format|
      if @doctor_profile.update(doctor_profile_params)
        format.html { redirect_to @doctor_profile, notice: 'Doctor profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor_profile }
      else
        format.html { render :edit }
        format.json { render json: @doctor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_profiles/1
  # DELETE /doctor_profiles/1.json
  def destroy
    @doctor_profile.destroy
    respond_to do |format|
      format.html { redirect_to doctor_profiles_url, notice: 'Doctor profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_profile
      @doctor_profile = DoctorProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_profile_params
      params.require(:doctor_profile).permit(:doctor_id, :date_of_birth, :gender, :address, :phone_number, :ethnicity, :occupation, :religion, :marital_status, :weight, :height, :year_of_grad, :specialization)
    end
end
