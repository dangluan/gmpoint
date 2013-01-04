module Gmpoint
  module ControllerMethod
    def help_to_point_on_map
      param = [params[:latitude], params[:longitude]].join(", ")
      location = Geocoder.search(param)
      @address = location[0].address
      render partial: "/locations/add_new_point_to_map"
    end
  end
end