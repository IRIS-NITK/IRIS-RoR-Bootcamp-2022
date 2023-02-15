class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:dark_mode, :light_mode]

  def dark_mode
    cookies[:dark_mode] = {
      value: 'dark_mode_on'
    }

    redirect_back(fallback_location: root_path)
  end

  def light_mode
    cookies.delete(:dark_mode)

    redirect_back(fallback_location: root_path)
  end
end
