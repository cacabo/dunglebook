class LocationController < ApplicationController
  before_action :set_location, only: [:edit, :update, :destroy]
  before_action :set_dungle, only: [:edit, :update, :destroy]
  before_action :set_user
  before_action :authorize_user, only: [:new, :edit, :update, :destroy]

  # GET /dungles/new
  def new
    @location = @dungle.location.build()
  end

  # GET /dungles/1/edit
  def edit
  end

  # POST /dungles
  # POST /dungles.json
  def create
    @location = @dungle.location.build(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to user_dungle_path(id: @dungle.id), notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: user_dungle_path(id: @dungle.id) }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dungles/1
  # PATCH/PUT /dungles/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to user_dungle_path(id: @dungle.id), notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: user_dungle_path(id: @dungle.id) }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dungles/1
  # DELETE /dungles/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to user_dungle_path(id: @dungle.id), notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    def set_dungle
      @dungle = Dungle.find(params[:dungle_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def authorize_user
      unless current_user === @user
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:title, :address, :longitude, :latitude)
    end
end
