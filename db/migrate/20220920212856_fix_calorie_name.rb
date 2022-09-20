class FixCalorieName < ActiveRecord::Migration[5.2]
  def change
    rename_column :ingredients, :calorie, :calories
  end
end
