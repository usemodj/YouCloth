class Role < ActiveRecord::Base
  has_many :role_children, :foreign_key => 'parent_id', :class_name => 'RoleRole'
  has_many :children, :through => :role_children

  has_many :role_parents, :foreign_key => 'role_id', :class_name => 'RoleRole'
  has_many :parents, :through => :role_parents
  
end
