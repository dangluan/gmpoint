module Gmpoint
  module ControllerMethod
    
    def init_map
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
    
    def add_new_point_to_map
      param = [params[:latitude], params[:longitude]].join(", ")
      location = Geocoder.search(param)
      @address = location[0].address
      render partial: "/locations/add_new_point_to_map"
    end
    
  end
end