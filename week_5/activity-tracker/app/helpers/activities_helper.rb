module ActivitiesHelper
  def flash_class(level)
    case level
    when :notice then 'alert alert-success'
    when :alert then 'alert alert-danger'
    end
  end
end
