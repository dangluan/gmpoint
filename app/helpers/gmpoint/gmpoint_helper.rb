module Gmpoint::GmpointHelper
  def show_map_helper
    html << content_tag(:div, id: "map_canvas") do
      content_tag(:div, class: "data-location", data: {id: @obj.id, latitude: @obj.latitude, longitude: @obj.longitude, zoom: @obj.})
    end
  end
end