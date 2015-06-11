class HospitalListsController < ApplicationController
  before_action :set_hospital_list, only: [:show, :edit, :update, :destroy]

  # GET /hospital_lists
  # GET /hospital_lists.json
  def index
    @hospital_lists = HospitalList.all
  end

  # GET /hospital_lists/1
  # GET /hospital_lists/1.json
  def show
  end

  # GET /hospital_lists/new
  def new
    @hospital_list = HospitalList.new
  end

  # GET /hospital_lists/1/edit
  def edit
  end

  # POST /hospital_lists
  # POST /hospital_lists.json
  def create
    @hospital_list = HospitalList.new(hospital_list_params)

    respond_to do |format|
      if @hospital_list.save
        format.html { redirect_to @hospital_list, notice: 'Hospital list was successfully created.' }
        format.json { render :show, status: :created, location: @hospital_list }
      else
        format.html { render :new }
        format.json { render json: @hospital_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospital_lists/1
  # PATCH/PUT /hospital_lists/1.json
  def update
    respond_to do |format|
      if @hospital_list.update(hospital_list_params)
        format.html { redirect_to @hospital_list, notice: 'Hospital list was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital_list }
      else
        format.html { render :edit }
        format.json { render json: @hospital_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_lists/1
  # DELETE /hospital_lists/1.json
  def destroy
    @hospital_list.destroy
    NotificationMailer.hospital_removed(@hospital_list.user, @hospital_list.hospital).deliver_now
    respond_to do |format|
      format.html { redirect_to hospital_lists_url, notice: 'Hospital list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_list
      @hospital_list = HospitalList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_list_params
      params.require(:hospital_list).permit(:user_id, :hospital_id)
    end
end
