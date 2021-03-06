class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy, :message]
  before_action :authenticate_user!
  
  require 'telegram/bot'
  # GET /shipments
  # GET /shipments.json
  def index
    @company = Company.find(params[:company_id])
    @company1 = Company.find_by_user_id(current_user.id)
    if @company.id != @company1.id && current_user.email != "admin@transwiz.com"
      @shipments = @company1.shipments
    else
      @shipments = @company.shipments
    end
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    if !@shipment.driver_id.blank?
      begin
      @driver=Driver.find(@shipment.driver_id)
      messagechatid = @driver.Chat_ID
      @chaturl="https://web.telegram.org/#/im?p=u#{messagechatid}"
      rescue
      @chaturl="https://web.telegram.org/"
      end
    else
      @chaturl="https://web.telegram.org/"
    end
  end

  # GET /shipments/new
  def new
    @company = Company.find(params[:company_id])
    @shipment = Shipment.new
    @shipment.company_id = @company.id
    @shipment.Status = "Por asignar"
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @company = Company.find(params[:company_id])
    @shipment = Shipment.new(shipment_params)

    if !@shipment.Client_ID.blank?
      @client=Client.find(@shipment.Client_ID)
      @shipment.Client_Name = @client.Name
      @shipment.Pickup_Location = @client.Address
    end

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
        format.html { redirect_to company_shipments_path}
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
      format.html { redirect_to company_shipments_path}
      format.json { head :no_content }
    end
  end

  def message
    # messagechatid = '244762094'
    
    if !@shipment.driver_id.blank?
      token = @company.Chat_ID
      begin
      @driver=Driver.find(@shipment.driver_id)
        messagechatid = @driver.Chat_ID
        messagetext = params[:shipment][:Chat_Message]
        
        Telegram::Bot::Client.run(token) do |bot|
        # bot.api.send_photo(chat_id: messagechatid, photo: Faraday::UploadIO.new('C:\Users\Manish\Desktop\AT.jpg', 'image/jpeg'))
        bot.api.send_message(chat_id: messagechatid, text: messagetext)
        redirect_to company_shipment_path(@company,@shipment), notice: 'Mensaje fue enviado con éxito.'
        end
      rescue
      redirect_to company_shipment_path(@company,@shipment), notice: 'No se encontró información para el conductor. Mensaje no fue enviado!'
      end
    else
      redirect_to company_shipment_path(@company,@shipment), notice: 'No se encontró información para el conductor. Mensaje no fue enviado.'
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @company = Company.find(params[:company_id])
      @shipment = Shipment.find(params[:id])

      if !@shipment.Client_ID.blank?
        @client=Client.find(@shipment.Client_ID)
        @shipment.Client_Name = @client.Name
        @shipment.Pickup_Location = @client.Address
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:Sub_Shipment, :Parent_Shipment_ID, :Status, :Client_ID, :Client_Name, :Pickup_Location, :Pickup_Date, :Pickup_Start_Time, :Pickup_End_Time, :Pickup_Gate, :Pickup_Contact_Person, :Pickup_Contact_No, :Weight, :Palletized, :No_of_Pallets, :Dropoff_Location, :Dropoff_Date, :Dropoff_Start_Time, :Dropff_End_Time, :Dropoff_Gate, :Dropoff_Contact_Person, :Dropff_Contact_No, :Comments, :Cargo_Type, :company_id, :Chat_Message, :Allocated_Truck_Type, :Assigned_To, :Allocated_Company_ID, :driver_id, :Allocated_Contact_Person, :Allocated_Contact_No, :Allocated_Date, :Allocated_By, :Chat_ID, :OtherDriver, :OtherClient, :Volume, :Driver_Name)
    end
end
