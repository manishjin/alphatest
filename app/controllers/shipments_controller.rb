class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  def index
    @company = Company.find(params[:company_id])
    @shipments = @company.shipments
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @company = Company.find(params[:company_id])
    @shipment = Shipment.new
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @company = Company.find(params[:company_id])
    @shipment = Shipment.new(shipment_params)

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to company_shipments_path(@company) }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:Sub_Shipment, :Parent_Shipment_ID, :Status, :Client_ID, :Client_Name, :Pickup_Location, :Pickup_Date, :Pickup_Start_Time, :Pickup_End_Time, :Pickup_Gate, :Pickup_Contact_Person, :Pickup_Contact_No, :Weight, :Palletized, :No_of_Pallets, :Dropoff_Location, :Dropoff_Date, :Dropoff_Start_Time, :Dropff_End_Time, :Dropoff_Gate, :Dropoff_Contact_Person, :Dropff_Contact_No, :Comments, :Cargo_Type, :company_id)
    end
end
