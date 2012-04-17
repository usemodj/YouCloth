class CustomersController < ApplicationController
  before_filter :authenticate_user!
  filter_resource_access :additional_collection => { :users => :read, :new_popup =>:read, :create_popup =>:read }
  layout 'admin'
  
  
  # GET /customers
  # GET /customers.json
  def index
    q = params[:q]
    field = params[:field]
    #logger.debug ">> field: #{field}"
    if q.blank?
      @customers = Customer.paginate(:page => params[:page]).order('name ASC, created_at DESC')
    else
      @customers = case field.to_sym
                when :name
                  Customer.where(" LOWER(name) LIKE ? ", "%#{q.downcase}%").paginate(:page => params[:page]).order('name ASC, created_at DESC')
                when :email
                  Customer.includes(:user).where(" LOWER(users.email) LIKE ? ", "%#{q.downcase}%").paginate(:page => params[:page]).order('customers.name ASC, customers.created_at DESC')

                when :phone
                  Customer.where(" phone LIKE ? OR mobile LIKE ? ", "%#{q}%", "%#{q}%").paginate(:page => params[:page]).order('name ASC, created_at DESC')

                when :address
                  Customer.where(" LOWER(address) LIKE ? OR LOWER(address2) LIKE ? ", "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('name ASC, created_at DESC')

                else #all
                  where = <<-DOCUMENT
                    LOWER(name) LIKE ? OR LOWER(users.email) LIKE ? OR 
                    phone LIKE ? OR mobile LIKE ? OR 
                    LOWER(address) LIKE ? OR LOWER(address2) LIKE ?  
                  DOCUMENT

                  Customer.includes(:user).where( where, "%#{q.downcase}%", "%#{q.downcase}%", "%#{q}%", "%#{q}%", "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('customers.name ASC, customers.created_at DESC')
                end
    end #end of if

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end


  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    @user = @customer.user
    
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      begin
        #@user = User.where( :email => params[:user][:email]).first_or_create!(:password => '123456')
        #@customer.user = @user
        
        if params[:user][:email].blank?
          raise  ActiveRecord::ActiveRecordError, 'email-is-required'
        elsif User.includes(:customer).where("users.id = customers.user_id  AND users.email = ? ",  params[:user][:email]).exists?
        #elsif  User.joins(:customer).where(" users.email = ? ", params[:user][:email] ).exists?
          raise ActiveRecord::ActiveRecordError, 'the-email-already-exists'
        else
          @user = User.where( :email => params[:user][:email]).first_or_create!(:password => '123456')
#          @user = User.create(params[:user]) do |u|
#            u.password = '123456'
#          end
          @user.update_attributes(params[:user])
          @customer.user = @user
        end
      rescue ActiveRecord::RecordInvalid, ActiveRecord::ActiveRecordError => e
       # flash[:notice] = 'User could not be created, the record is invalid'
        flash[:notice] = I18n.t(e.message)
      end
      if @user.nil?
         @user = User.new
         format.html { render action: "new"}
      elsif  @customer.save
        format.html { redirect_to @customer, notice: t('customer-was-successfully-created') }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new", notice: t('customer-was-not-created') }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])
    @user = User.find(params[:user][:id])
    respond_to do |format|
      if @customer.update_attributes(params[:customer]) and @user.update_attributes(params[:user])
        format.html { redirect_to @customer, notice:  t('customer-was-successfully-updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
  

  def users
    if !User.where(" email LIKE LOWER(?)", "%#{params[:email].downcase}%").exists?
      flash[:notice]= t('it-does-not-registered-email-yet')
    else
      @users = User.where(" email LIKE LOWER(?) AND users.id NOT IN(SELECT customers.user_id FROM customers) ", "%#{params[:email].downcase}%").limit(20) #.order("user.email")
      if @users.exists? then 
        flash[:notice]=t('this-email-has-not-customer-information-yet') 
      else
        flash[:notice]= t('this-email-has-customer-information-already')
      end
    end
    respond_to do |format|
      format.html { render :partial => "customers/users", :object => @users }
    end
  end

  def new_popup
    @customer = Customer.new
    @user = User.new
    #render(:layout => false)
    respond_to do |format|
      format.html {render(:layout=> 'popup')}
    end
  end

  # POST /customers/create_popup
  def create_popup
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      begin
        #@user = User.where( :email => params[:user][:email]).first_or_create!(:password => '123456')
        #@customer.user = @user
        
        if params[:user][:email].blank?
          raise  ActiveRecord::ActiveRecordError, 'email-is-required'
        elsif User.includes(:customer).where("users.id = customers.user_id  AND users.email = ? ",  params[:user][:email]).exists?
        #elsif  User.joins(:customer).where(" users.email = ? ", params[:user][:email] ).exists?
          raise ActiveRecord::ActiveRecordError, 'the-email-already-exists'
        else
          @user = User.where( :email => params[:user][:email]).first_or_create!(:password => '123456')
#          @user = User.create(params[:user]) do |u|
#            u.password = '123456'
#          end
          @user.update_attributes(params[:user])
          @customer.user = @user
        end
      rescue ActiveRecord::RecordInvalid, ActiveRecord::ActiveRecordError => e
       # flash[:notice] = 'User could not be created, the record is invalid'
        flash[:notice] = I18n.t(e.message)
      end
      if @user.nil?
          #@user = User.new
        format.html { render :layout => 'popup', notice: t('customer-was-not-created') }
      elsif  @customer.save
        format.html { render :layout => 'popup', notice: t('customer-was-successfully-created') }
      else
        format.html { render :layout => 'popup', notice: t('customer-was-not-created') }
      #   #format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

end
