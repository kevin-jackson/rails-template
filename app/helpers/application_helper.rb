module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then "primary"
    when :success then "success"
    when :error then "alert"
    when :alert then "alert"
    end
  end
end
