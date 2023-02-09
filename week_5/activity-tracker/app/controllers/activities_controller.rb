class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user

  # GET /activities or /activities.json
  def index
    #@activities = Activity.all
    @activities = current_user.activities.reload
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    #@activity = Activity.new
    @activity = current_user.activities.build
  end

  # GET /activities/1/edit
  def edit
    @activity = current_user.activities.find(params[:id])
    redirect_to root_path, notice: "Not Allowed Smarty Pants" if current_user.activities.find(params[:id]).nil?
  end

  # GET /activities/stats/
  def stats
    @total_duration = current_user.activities.sum(:duration)
    @total_calories = current_user.activities.sum(:calories)
  end

  # POST /activities or /activities.json
  def create
    #@activity = Activity.new(activity_params)
    @activity = current_user.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @activity = current_user.activities.find_by(id: params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:title, :activity_type, :start, :duration, :calories, :total_calories, :total_duration, :user_id)
    end
end
