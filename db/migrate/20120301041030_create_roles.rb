class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :roles, :name,  :unique => true
    Role.create(:name => 'guest',:description  => 'sugin up default role')
    Role.create(:name => 'admin',:description => 'administrator role' )
#   Role.where( :name => 'guest').first_or_create(:description  => 'sugin up default role')
#   Role.where( :name => 'admin').first_or_create(:description => 'administrator role')
  end
      
end