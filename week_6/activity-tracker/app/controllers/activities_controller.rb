class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end
  
  def generate_pdf
    @activities = current_user.activities # or use any other query to fetch activities
    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Activities", size: 18, style: :bold, align: :center
        @activities.each do |activity|
          pdf.text activity.title, size: 16, style: :bold
          pdf.text "Activity-Type: #{activity.activity_type}"
          img = StringIO.open(activity.image.download)
          pdf.image img, fit: [100, 100]
          pdf.text "Start: #{activity.start}"
          pdf.text "Duration: #{activity.duration} minutes"
          pdf.text "Calories: #{activity.calories} minutes"
          pdf.move_down 10
        end
        send_data pdf.render, filename: "activities.pdf", type: "application/pdf", disposition: "attachment"
      end
    end
  end
end

  # POST /activities or /activities.json
  def create
    @activity =  current_user.activities.build(activity_params)

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
      if @activity.update(activity_params.merge(user_id: current_user.id))
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
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
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:title, :activity_type, :start, :duration, :calories, :image)
    end
end
