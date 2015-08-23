class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy, :our_doctors]

  # GET /hospitals
  # GET /hospitals.json
  def index
    authorize! :read, Hospital
    @hospitals = Hospital.verified
    @mine_hospitals = current_user.hospitals.verified
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
    authorize! :read, Hospital
    @reviews = Review.where(hospital_id: params[:id])
    @recommend = HospitalLike.where(hospital_id: params[:id])
  end

  # GET /hospitals/new
  def new
    authorize! :manage, Hospital
    @hospital = Hospital.new
  end

  # GET /hospitals/1/edit
  def edit
    authorize! :manage, Hospital
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    authorize! :manage, Hospital
    @hospital = current_user.hospitals.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: 'Hospital was successfully created.' }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitals/1
  # PATCH/PUT /hospitals/1.json
  def update
    authorize! :manage, Hospital
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    authorize! :manage, Hospital
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def our_doctors
    authorize! :read, :all
    @doctors = DoctorList.where(hospital_id: @hospital.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_params
      params.require(:hospital).permit(:name, :description, :image, :verified, :address, :classification, :phone_number)
    end
end
