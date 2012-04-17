class Role < ActiveRecord::Base
  #using_access_control
  
  has_many :role_children, :foreign_key => 'parent_id', :class_name => 'RoleRole'
  has_many :children, :through => :role_children

  has_many :role_parents, :foreign_key => 'role_id', :class_name => 'RoleRole'
  has_many :parents, :through => :role_parents
   
  has_and_belongs_to_many :users
end
