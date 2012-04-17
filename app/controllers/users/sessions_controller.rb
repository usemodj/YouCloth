class Users::SessionsController < Devise::SessionsController
  #before_filter :authenticate_user!
 # filter_resource_access 

  def new
    super
  end
  def create
    super
  end
  
  def destroy
    super
  end
  def sign_up
    #@roles = Role.all
    #@role = Role.find(params[:id])
    @role = Role.new
    @roles = current_user.roles
    #logger.debug ">> roles: #{@roles}"
  end
end
