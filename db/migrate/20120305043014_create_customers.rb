class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile
      t.string :phone
      t.string :address
      t.string :address2
      t.string :zipcode
      t.references :user

      t.timestamps
    end
    add_index :customers, :user_id
  end
end
