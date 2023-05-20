class AddDescriptionToBicycle < ActiveRecord::Migration[7.0]
  def change
    add_column :bicycles, :description, :string
  end
end
