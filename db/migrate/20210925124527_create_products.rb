class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :vehicle_make
      t.string :model
      t.string :name
      t.string :vehicle_code
      t.string :color
      t.string :transmission
      t.string :fuel_type
      t.string :engine_type
      t.string :engine_capacity
      t.string :power
      t.string :fuel_consumption
      t.integer :manufacturing_year
      t.decimal :price, precision: 19, scale: 2
      t.integer :discount
      t.text :features
      t.text :description
      t.text :accessories
      t.string :thumbnail
      t.string :logo
      t.integer :state
      t.references :owner, index: true, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
