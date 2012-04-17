class CreateRolesUsers < ActiveRecord::Migration
  def  change
    create_table(:roles_users) do |t|
      t.integer :role_id,   :null => false
      t.integer :user_id,   :null => false
      #t.timestamps
    end
    
    role = Role.where( :name => 'admin')
    user = User.new(:email =>'admin@youcloth.kr', :password => '123456')
    user.roles << role
    user.save
  end
end
