class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :title
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
