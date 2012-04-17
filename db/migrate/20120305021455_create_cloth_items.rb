class CreateClothItems < ActiveRecord::Migration
  def change
    create_table :cloth_items do |t|
      t.integer :no
      t.string :name
      t.integer :unit_price
      
      t.timestamps
    end
    add_index :cloth_items, :name,  :unique => true
  end
  
end
