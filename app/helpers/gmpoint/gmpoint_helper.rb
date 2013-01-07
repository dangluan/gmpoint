module Gmpoint::GmpointHelper
  def show_map_helper
    html << content_tag(:div, id: "map_canvas", style: {width: 1200px, height: 500px, margin:0 auto, border:1px solid green})
    html << content_tag(:div, class: "data-location", data: {latitude: , longitude: , zoom: })
  end
  
  def get_address
    html << content_tag(:div, id: "form-add-point") do
      content_tag(:p, "Address: #{@address.to_s}")
    end
  end
  
end