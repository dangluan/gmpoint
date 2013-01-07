module Gmpoint::GmpointHelper
  
  def google_map_api_js(key="AIzaSyA344yCug0-GhjW3XJyZmkLWLN_qtA_ziM")
    javascript_include_tag "https://maps.googleapis.com/maps/api/js?key=#{key}&sensor=true"
  end
  
  def show_map_helper(model_name, opts={})
    opts = {width: 800, height: 400, latitude: 1.3667, longitude: 103.75, zoom: 13, style: "border: 1px solid #green;"}.merge(opts)
    [
      content_tag(:div, :id => "geopoint_search_box_container", style: "width: #{opts[:width]}px; margin: 0 auto; margin-bottom: 10px;") do
        tag(:input, type: :text, placeholder: 'Search', id: "gmpoint_#{model_name}_search_box")
      end,      
      content_tag(:div, '', id: "map_canvas", style: "width: #{opts[:width]}px; height: #{opts[:height]}px; #{opts[:style]}"),
      content_tag(:div, '', class: "data-location", data: {model: model_name, latitude: opts[:latitude] , longitude: opts[:longitude] , zoom: opts[:zoom]}),
      tag(:input, type: :hidden, value: '', name: "#{model_name}[location_latitude]", id: "gmpoint_location_latitude"),
      tag(:input, type: :hidden, value: '', name: "#{model_name}[location_longitude]", id: "gmpoint_location_longitude"),
      tag(:input, type: :hidden, value: '', name: "#{model_name}[location_address]", id: "gmpoint_location_address"),
      javascript_tag("window.initJsMap();")
    ].join.html_safe
  end
  
  def get_address
    content_tag(:div, id: "form-add-point") do
      content_tag(:p, "Address: #{@address.to_s}")
    end
  end
  
end