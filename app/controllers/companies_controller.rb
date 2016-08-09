class CompaniesController < ApplicationController
  # before_action :set_company, only: [:show, :edit, :update, :destroy]
  # GET /companies # GET /companies.json
  def index
    set_company
  end

  # GET /companies/1 # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    @clients = @company.clients
    @employees = @company.employees
    @drivers = @company.drivers
    @shipments = @company.shipments
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies # POST /companies.json
  def create
    @company = Company.new(company_params)

    
    if @company.save
      redirect companies_path, notice: 'Company was successfully created.' 
    else
      set_company
      render :action => :index
    end
  end

  # PATCH/PUT /companies/1 # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # # DETAILS 
  # def details
  #   @company = Company.find(params[:company_id])
  #   @clients = @company.clients
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @companies = Company.all
      @company = Company.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:Name, :Address, :NIF, :CreatedBy, :UpdatedBy)
    end
end
