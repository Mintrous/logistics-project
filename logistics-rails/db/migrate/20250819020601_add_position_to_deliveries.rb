class AddPositionToDeliveries < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :position, :integer
  end
end
