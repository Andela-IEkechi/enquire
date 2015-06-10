class DoctorListsController < ApplicationController
  before_action :set_doctor_list, only: [:show, :edit, :update, :destroy]

  # GET /doctor_lists
  # GET /doctor_lists.json
  def index
    @doctor_lists = DoctorList.all
  end

  # GET /doctor_lists/1
  # GET /doctor_lists/1.json
  def show
  end

  # GET /doctor_lists/new
  def new
    @doctor_list = DoctorList.new
  end

  # GET /doctor_lists/1/edit
  def edit
  end

  # POST /doctor_lists
  # POST /doctor_lists.json
  def create
    @doctor_list = DoctorList.new(doctor_list_params)

    respond_to do |format|
      if @doctor_list.save
        format.html { redirect_to @doctor_list, notice: 'Doctor list was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_list }
      else
        format.html { render :new }
        format.json { render json: @doctor_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctor_lists/1
  # PATCH/PUT /doctor_lists/1.json
  def update
    respond_to do |format|
      if @doctor_list.update(doctor_list_params)
        format.html { redirect_to @doctor_list, notice: 'Doctor list was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor_list }
      else
        format.html { render :edit }
        format.json { render json: @doctor_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_lists/1
  # DELETE /doctor_lists/1.json
  def destroy
    @doctor_list.destroy
    NotificationMailer.doctor_removed(@doctor_list.user, @doctor_list.hospital).deliver_now
    respond_to do |format|
      format.html { redirect_to doctor_lists_url, notice: 'Doctor list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_list
      @doctor_list = DoctorList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_list_params
      params.require(:doctor_list).permit(:user_id, :hospital_id)
    end
end
