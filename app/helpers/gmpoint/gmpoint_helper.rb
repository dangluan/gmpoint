module ShowMap::Gmpoint
  def show_map_helper(model_name)
    @obj = ActiveSupport::Inflector.constantize(ActiveSupport::Inflector.classify(model_name)).find(params[:id])
    html << content_tag(:div, id: "map_canvas") do
      content_tag(:div, class: "data-location", data: {id: @obj.id, latitude: @obj.latitude, longitude: @obj.longitude})
    end
  end
end