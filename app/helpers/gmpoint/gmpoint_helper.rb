module Gmpoint::GmpointHelper
  def show_map_helper
    html << content_tag(:div, id: "map_canvas")
    html << content_tag(:div, class: "data-location", data: {id: , latitude: , longitude: , zoom: })
  end
end