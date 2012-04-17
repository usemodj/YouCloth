class CreateWashes < ActiveRecord::Migration
  def change
    create_table :washes do |t|
      t.string :email
      t.string :name
      t.string :mobile
      t.string :phone
      t.string :address
      t.string :address2
      t.date :stocked_on
      t.date  :released_on
      t.string :status
      t.text :memo
      t.references :customer
      
      t.timestamps
    end

     add_index :washes, :customer_id
 end
end
