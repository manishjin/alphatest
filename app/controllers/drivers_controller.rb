class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  # GET /drivers
  # GET /drivers.json
  def index
    @company = Company.find(params[:company_id])
    @drivers = @company.drivers
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @company = Company.find(params[:company_id])
    @driver = Driver.new
    @driver.company_id = @company.id
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @company = Company.find(params[:company_id])
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to company_drivers_path }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to company_drivers_path(@company), notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to company_drivers_path(@company) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @company= Company.find(params[:company_id])
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:First_Name, :Last_Name, :Telephone, :Email, :Truck_No, :Social_Sec, :Verified, :company_id, :Chat_ID)
    end
end
