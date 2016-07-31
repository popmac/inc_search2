module ApplicationHelper

  def tool_name(tool_id)
    Tool.find(tool_id)
  end

end
