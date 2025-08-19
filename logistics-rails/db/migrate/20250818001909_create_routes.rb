class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.json :input_points
      t.json :ordered_points
      t.float :total_distance
      t.string :status

      t.timestamps
    end
  end
end
