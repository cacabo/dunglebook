class DunglesController < ApplicationController
  before_action :set_dungle, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :authorize_user, only: [:new, :edit, :update, :destroy]

  # GET /dungles
  # GET /dungles.json
  def index
    @dungles = Dungle.all
  end

  # GET /dungles/1
  # GET /dungles/1.json
  def show
  end

  # GET /dungles/new
  def new
    @dungle = @user.dungles.build()
  end

  # GET /dungles/1/edit
  def edit
  end

  # POST /dungles
  # POST /dungles.json
  def create
    @dungle = @user.dungles.build(dungle_params)

    respond_to do |format|
      if @dungle.save
        format.html { redirect_to user_dungle_path(id: @dungle.id), notice: 'Dungle was successfully created.' }
        format.json { render :show, status: :created, location: user_dungle_path(id: @dungle.id) }
      else
        format.html { render :new }
        format.json { render json: @dungle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dungles/1
  # PATCH/PUT /dungles/1.json
  def update
    respond_to do |format|
      if @dungle.update(dungle_params)
        format.html { redirect_to user_dungle_path(id: @dungle.id), notice: 'Dungle was successfully updated.' }
        format.json { render :show, status: :ok, location: user_dungle_path(id: @dungle.id) }
      else
        format.html { render :edit }
        format.json { render json: @dungle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dungles/1
  # DELETE /dungles/1.json
  def destroy
    @dungle.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Dungle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dungle
      @dungle = Dungle.find(params[:id])
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
    def dungle_params
      params.require(:dungle).permit(:user_id, :title, :description, :performance, :ambience, :scent, :cleanliness, :traffic, :location_title, :address, :longitude, :latitude)
    end
end
