class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: [:show, :edit, :update, :destroy]
   before_action :user_is_current_user, only: [:show, :edit, :update, :destroy]
  # GET /availabilities
  # GET /availabilities.json
  def index
    @availabilities = Availability.all
  end

  # GET /availabilities/1
  # GET /availabilities/1.json
  def show
    @requests = @availability.requests
  end

  # GET /availabilities/new
  def new
    @availability = Availability.new
    @availability.user_id = current_user.id
  end

  # GET /availabilities/1/edit
  def edit
    
  end

  # POST /availabilities
  # POST /availabilities.json
  def create
    @availability = Availability.new(availability_params)
    @availability.user_id = current_user.id
    @availability.status = 'Available'
    @availability.title = current_user.email
    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: 'Availability was successfully created.' }
        format.json { render :show, status: :created, location: @availability }
      else
        format.html { render :new }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availabilities/1
  # PATCH/PUT /availabilities/1.json
  def update
    if current_user.admin?
      @availability.update(:status => "Confirmed")
      if @availability.title?
        @availability.user.update(:email => @availability.title)
      end 
    end
    respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to @availability, notice: 'Availability was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability }
      else
        format.html { render :edit }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availabilities/1
  # DELETE /availabilities/1.json
  def destroy
    @availability.destroy
    respond_to do |format|
      format.html { redirect_to availabilities_url, notice: 'Availability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability
      @availability = Availability.find(params[:id])
    end
    def user_is_current_user
      unless current_user == @availability.user or current_user.admin
        redirect_to(availabilities_url, alert: "You cannot edit view this") and return
      end
    end
     

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      params.require(:availability).permit(:start_time, :end_time, :assigned, :user_id, :test_name, :start, :end, :title, :request, :status)
    end
end