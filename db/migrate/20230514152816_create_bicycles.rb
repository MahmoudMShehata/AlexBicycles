class CreateBicycles < ActiveRecord::Migration[7.0]
  def change
    create_table :bicycles do |t|
      t.string :model
      t.string :style
      t.decimal :price
      t.string :color

      t.timestamps
    end
  end
end
