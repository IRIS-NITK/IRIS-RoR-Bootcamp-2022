class StatisticsController < ApplicationController
  def stats

        @user=User.find(params[:id])
  end

end
