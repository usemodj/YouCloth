class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :login
  
#  has_many :roles_users
#  has_many :roles, :through => :roles_users
  has_and_belongs_to_many :roles
  has_one :customer
  has_many :posts
  has_many :comments, :as => :commentable  

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
