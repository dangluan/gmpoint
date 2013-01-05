module Gmpoint
  module ClassMethod
    def init_point
      attr_accessible :address, :latitude, :longitude
      geocoded_by :address
      after_validation :geocode, if: :address_changed?
    end
  end
end