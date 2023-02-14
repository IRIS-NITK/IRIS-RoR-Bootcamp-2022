class StatsController < ApplicationController

  def index
    @total_duration = 0
    @total_calorie = 0
    activities = Activity.all;
    activities.each do |activity|
      @total_duration += activity.duration
      @total_calorie += activity.calories
    end
  end

end

