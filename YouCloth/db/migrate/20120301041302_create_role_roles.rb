class CreateRoleRoles < ActiveRecord::Migration
  def change
    create_table :role_roles do |t|
      t.integer :role_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
