module Gmpoint::GmpointHelper
  
  def google_map_api_js(key="AIzaSyA344yCug0-GhjW3XJyZmkLWLN_qtA_ziM")
    javascript_include_tag "https://maps.googleapis.com/maps/api/js?key=#{key}&sensor=true"
  end
  
  def show_map_helper(model_name, opts={})
    
    object = model_name.to_s.singularize.classify.constantize.find(params[:id])
    @address = object.location_address
    @latitude = object.location_latitude
    @longitude = object.location_longitude
    opts = {allow: 'show', searchbox: 'show', width: 800, height: 400, latitude: 1.3667, longitude: 103.75, zoom: 13, style: "border: 1px solid #green;", searchbox_width: 400}.merge(opts)
    [
      content_tag(:div, :id => "geopoint_search_box_container", style: "width: #{opts[:searchbox_width]}px; margin: 0 auto; margin-bottom: 10px; display: #{opts[:searchbox]}") do
        tag(:input, type: :text, placeholder: 'Search', id: "gmpoint_#{model_name}_search_box", style: "width: #{opts[:searchbox_width]}px; border:1px solid #{:color};")
      end,      
      content_tag(:div, '', id: "map_canvas", style: "width: #{opts[:width]}px; height: #{opts[:height]}px; #{opts[:style]}"),
      content_tag(:div, '', class: "data-location", data: {model: model_name, latitude: opts[:latitude] , longitude: opts[:longitude] , zoom: opts[:zoom]}),
      tag(:input, type: :hidden, value: "#{opts[:allow]}", name: "allow", id: "gmpoint_map_allow"),
      tag(:input, type: :hidden, value: "#{@latitude}", name: "#{model_name}[location_latitude]", id: "gmpoint_location_latitude"),
      tag(:input, type: :hidden, value: "#{@longitude}", name: "#{model_name}[location_longitude]", id: "gmpoint_location_longitude"),
      tag(:input, type: :hidden, value: "#{@address}", name: "#{model_name}[location_address]", id: "gmpoint_location_address"),
      javascript_tag("window.initJsMap();")
    ].join.html_safe
  end
end