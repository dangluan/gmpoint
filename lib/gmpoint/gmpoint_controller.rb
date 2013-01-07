module Gmpoint
  module ControllerMethod
    def help_to_point_on_map
      if params[:search].present?
        location = Geocoder.search(params[:search])
        if location.empty?
          @location = Geocoder.search("20, -10")
          @zoom = 3
        else
          @location = Geocoder.search(params[:search])
          @zoom = 8
        end
      else
        @location = Geocoder.search("20, -10")
        @zoom = 3
      end
    end
  end
end