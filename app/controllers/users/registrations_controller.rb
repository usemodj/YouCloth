class Users::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    @role = Role.new
    resource = build_resource({})
    respond_with resource
  end

  # POST /resource
  def create
    params[:user][:role_ids]  ||= []
    build_resource
    # first user has a 'admin' role
    if resource.class.count < 1
      role = Role.find_by_name(:admin)
    else
      # the other users are 'guest' role
      role = Role.find_by_name(:guest)
    end
    resource.roles << role 
    
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  # GET /resource/edit
  def edit
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    @customer = Customer.find_by_user_id( resource.id)
    @customer ||= Customer.new 
    render :edit
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    params[:user][:role_ids]  ||= []
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    if resource.update_with_password(params[resource_name])
      if is_navigational_format?
        if resource.respond_to?(:pending_reconfirmation?) && resource.pending_reconfirmation?
          flash_key = :update_needs_confirmation
        end
        set_flash_message :notice, flash_key || :updated
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

#  # DELETE /resource
#  def destroy
#    resource.destroy
#    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
#    set_flash_message :notice, :destroyed if is_navigational_format?
#    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
#  end
#
#  # GET /resource/cancel
#  # Forces the session data which is usually expired after sign
#  # in to be expired now. This is useful if the user wants to
#  # cancel oauth signing in/up in the middle of the process,
#  # removing all OAuth session data.
#  def cancel
#    expire_session_data_after_sign_in!
#    redirect_to new_registration_path(resource_name)
#  end
  def change_customer
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    @customer = Customer.find_by_user_id( resource.id)
    respond_to do |format|
     if @customer.nil?
            @customer = Customer.new(params[:customer])
            @customer.user = resource
            if @customer.save
              format.html { redirect_to edit_user_registration_path, notice: t('customer-was-successfully-created') }
             else 
              format.html { render action: "edit", notice: t('customer-was-not-created') }
           end
      else
        if @customer.update_attributes(params[:customer])
          format.html { redirect_to edit_user_registration_path, notice:  t('customer-was-successfully-updated') }
        else
          format.html { render action: "edit" }
        end
      end
    end
  end

end
