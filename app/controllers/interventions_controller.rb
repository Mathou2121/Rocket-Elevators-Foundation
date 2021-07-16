class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @customers = Customer.all
    @intervention = Intervention.new
    @employee = Employee.all
  end

  # /interventions/building_fetch
  def building_fetch
    @buildings = Building.where(customer_id: params[:customer_id])
    puts @buildings
    respond_to do |format|
      format.json { render :json => @buildings}
    end
  end

  def battery_fetch
    @battery = Battery.where(building_id: params[:building_id])
    puts @battery
    respond_to do |format|
      format.json { render :json => @battery}
    end
  end

  def column_fetch
    @column = Column.where(battery_id: params[:battery_id])
    puts @column
    respond_to do |format|
      format.json { render :json => @column}
    end
  end

  def elevator_fetch
    @elevator = Elevator.where(elevator_id: params[:elevator_id])
    puts @elevator
    respond_to do |format|
      format.json { render :json => @elevator}
    end
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :startdate, :enddate, :result, :report, :status)
    end
end
