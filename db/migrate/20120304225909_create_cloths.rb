class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.integer :unit_price
      t.integer  :count
      t.string  :repair
      t.integer :repair_price
      t.string :status
      t.date :released_on  #출고일
      
      t.references :wash   
      t.references :cloth_item   
      
      t.timestamps
    end
  end
end