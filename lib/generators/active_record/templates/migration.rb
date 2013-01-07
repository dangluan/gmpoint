class GmpointAddColumnsTo<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    add_column :<%= table_name %>, :location_latitude, :float
    add_column :<%= table_name %>, :location_longitude, :float
    add_column :<%= table_name %>, :location_address, :string
  end
end
