authorization do
  role :guest do
    #has_permission_on :roles, :to => :read
    # has_permission_on :permissions, :to => :read # assignments in your case.
    has_permission_on [:comments, :posts], :to => [:read, :create, :update, :delete]
    has_permission_on :you, :to => [:read] do
       if_attribute :user => is { user }
    end
  end

  role :user do
    includes :guest
  end

  # role :admin do 
  #   description "Administrators" 
  #   has_omnipotence # Can manage all 
  # end 

  role :admin do
    includes :guest
    has_permission_on :authorization_rules, :to => :manage
    has_permission_on :authorization_usages, :to => :manage
    has_permission_on :roles, :to => :manage
    has_permission_on :users, :to => :manage
    has_permission_on :customers, :to => [:manage]
    has_permission_on :washes, :to => :manage
    has_permission_on :cloths, :to => :manage
    has_permission_on :cloth_items, :to => :manage
    has_permission_on :admin_posts, :to => :manage 
    has_permission_on :admin_comments, :to => [:manage, :reply] 
    has_permission_on :admin_dashboard, :to=> :manage
   #has_permission_on [:comments, :posts], :to => [:read, :create, :update, :delete]
  end

  #role :admin do
  #  has_permission_on [:roles, :users, 'users/sessions', :authorization_rules], :to => [:index, :show, :new, :create, :edit, :update, :destroy,:sign_up]
  #  has_permission_on [:authorization_rules, :authorization_usages, authorization_graph]
  #end
  #
  #role :guest do
  #  has_permission_on :roles, :to => [:index, :show]
  #  has_permission_on :comments, :to => [:new, :create]
  #  has_permission_on :comments, :to => [:edit, :update] do
  #    if_attribute :user => is { user }
  #  end
  #end
  #
  #role :moderator do
  #  includes :guest
  #  has_permission_on :comments, :to => [:edit, :update]
  #end
  #
  #role :author do
  #  includes :guest
  #  has_permission_on :articles, :to => [:new, :create]
  #  has_permission_on :articles, :to => [:edit, :update] do
  #    if_attribute :user => is { user }
  #  end
  
end

privileges do
  privilege :manage, :includes => [:read,:create, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end

