class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities=Activity.where(user_id: current_user.id)
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  def stats
    @total_duration = Activity.where(user_id: current_user.id).sum(:duration)
    @total_calories = Activity.where(user_id: current_user.id).sum(:calories)
  end

  def pdf
    require "prawn"
    pdf1 = Prawn::Document.new
    pdf1.text current_user.email,align: :center ,size: 30,style: :bold
    pdf1.text "\nActivities\n",align: :center ,size: 25,style: :bold
    @activities=Activity.where(user_id: current_user.id)
    if @activities.any?
      @activities.each do |activity|
        pdf1.text activity.title,size: 20,style: :bold
        act_img=StringIO.open(activity.image.download)
        pdf1.image act_img,fit: [300,300]
        pdf1.text activity.activity_type,size: 15
        # pdf1.text activity.duration.to_s,size: 15
        # pdf1.text activity.calories,size: 15
      end
    else
      pdf1.text "No Activity",size: 20,style: :bold
    end
    send_data(pdf1.render,filename: "#{current_user.email}.pdf",type: 'application/pdf' , disposition: 'inline')
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
    @activity.user_id=current_user.id
    respond_to do |format|
      if @activity.save
        format.html { redirect_to activities_url, notice: "Activity was successfully created." }
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
      format.html { redirect_to activities_url,status: :see_other, notice: "Activity was successfully destroyed." }
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
