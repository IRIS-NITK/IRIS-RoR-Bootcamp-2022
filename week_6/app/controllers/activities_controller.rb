$totalduration=0
$totalcalorie=0
class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]


  # GET /activities or /activities.json
  def index

   @user=current_user
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

def anish
$totalduration
$totalcalorie
end


def stat
  @user=current_user
      respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "activities/anish",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
end


  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.user=current_user
    $totalcalorie=$totalcalorie+@activity.calories
    $totalduration=$totalduration+@activity.calories
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      if params[:id] != 'stats'
      @activity = Activity.find(params[:id])
    end
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:title, :activetype, :start, :duration,:user_id , :calories, :profile , :active )
    end
end
