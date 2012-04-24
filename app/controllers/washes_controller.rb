
class WashesController < ApplicationController
   before_filter :authenticate_user!  
   filter_resource_access  :additional_collection => { :customers => :read }
    layout "admin"

  # GET /washes
  # GET /washes.json
  def index
    q = params[:q]
    field = params[:field]
    #logger.debug ">> field: #{field}"
    if q.blank?
      @washes = Wash.paginate(:page => params[:page]).order('stocked_on DESC, id ASC')
      #@washes = Wash.paginate :page => params[:page] || 1, :per_page => 2, :order => 'stocked_on DESC, created_at ASC'
    else
      q.strip!
      field.strip!
      @washes = case field.to_sym
                when :name
                  Wash.where(" LOWER(name) LIKE ? ", "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[" LOWER(name) LIKE ? ", "%#{q.downcase}%"],:order =>'stocked_on DESC, created_at ASC'
                when :email
                  Wash.where(" LOWER(email) LIKE ? ", "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[" LOWER(email) LIKE ? ", "%#{q.downcase}%"],:order =>'stocked_on DESC, created_at ASC'
                when :phone
                  Wash.where(" phone LIKE ? OR mobile LIKE ? ", "%#{q}%", "%#{q}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[" phone LIKE ? OR mobile LIKE ? ", "%#{q}%", "%#{q}%"], :order =>'stocked_on DESC, created_at ASC'
                when :address
                  Wash.where(" LOWER(address) LIKE ? OR LOWER(address2) LIKE ? ", "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[" LOWER(address) LIKE ? OR LOWER(address2) LIKE ? ", "%#{q.downcase}%", "%#{q.downcase}%"],:order =>'stocked_on DESC, created_at ASC'
                when :stocked_on
                  Wash.where(" stocked_on LIKE ? ", "%#{q}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[" stocked_on LIKE ? ", "%#{q}%"], :order =>'stocked_on DESC, created_at ASC'
                when :released_on
                  Wash.where(" released_on LIKE ? ", "%#{q}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[" released_on LIKE ? ", "%#{q}%"], :order =>'stocked_on DESC, created_at ASC'
                when :status
                  Wash.where(" LOWER(status) LIKE ? ", "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[" LOWER(status) LIKE ? ", "%#{q.downcase}%"], :order =>'stocked_on DESC, created_at ASC'
                 when :customer_id
                  Wash.where(" customer_id = ? ", q).paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                else #all
                  where = <<-DOCUMENT
                    LOWER(name) LIKE ? OR LOWER(email) LIKE ? 
                    OR phone LIKE ? OR mobile LIKE ? 
                    OR LOWER(address) LIKE ? OR LOWER(address2) LIKE ?  
                    OR LOWER(status) LIKE ?  
                  DOCUMENT

                  Wash.where( where, "%#{q.downcase}%", "%#{q.downcase}%", "%#{q}%", "%#{q}%", "%#{q.downcase}%", "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, id ASC')
                  #Wash.paginate :page => params[:page]||1, :per_page => 2,:conditions =>[ where, "%#{q.downcase}%", "%#{q.downcase}%", "%#{q}%", "%#{q}%", "%#{q.downcase}%", "%#{q.downcase}%", "%#{q}%", "%#{q}%"], :order =>'stocked_on DESC, created_at ASC'
                end
    end #end of if
    #@show_pagination = @washes.length > 0 && @washes.total_pages > 1
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @washes }
    end
  end

  # GET /washes/1
  # GET /washes/1.json
  def show
    @wash = Wash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wash }
    end
  end

  # GET /washes/new
  # GET /washes/new.json
  def new
    @wash = Wash.new
    @cloth_items = ClothItem.all( :order  => :no)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wash }
    end
  end

  # GET /washes/1/edit
  def edit
    @wash = Wash.find(params[:id])
      #@cloth_items = ClothItem.all(:order => :no)
      #@cloth_items = ClothItem.includes(:cloth)
      #@cloth_items = ClothItem.joins(" LEFT OUTER JOIN cloths ON  cloths.cloth_item_id = cloth_items.id  AND  cloths.wash_id = #{params[:id]}")
    sql = <<-QUERY
          SELECT `cloth_items`.*, `cloths`.id AS cloth_id, `cloths`.unit_price AS cloth_unit_price,  
          `cloths`.count AS cloth_count, `cloths`.repair AS cloth_repair, 
          `cloths`.repair_price AS cloth_repair_price, `cloths`.status AS cloth_status  
          FROM `cloth_items` LEFT OUTER JOIN cloths ON cloths.cloth_item_id = cloth_items.id 
            AND cloths.wash_id =? 
          ORDER BY cloth_items.no
    QUERY
    @cloth_items = ClothItem.find_by_sql([sql, params[:id]])
  end

  # POST /washes
  # POST /washes.json
  def create
    @wash = Wash.new(params[:wash])
    @customer = Customer.find(@wash.customer_id)
    #local.attributes = remote.attributes.inject({}){|h,(k,v)| h[k]=v if Model.column_names.include?(k); h 
    @wash.attributes = @customer.attributes.inject({}){|h,(k,v)| h[k]=v if Wash.column_names.include?(k); h }
    @wash.updated_at = nil;
    @wash.created_at = nil;
    @wash.status = YouCloth::STATUSES[0]
    #TODO: attributes.delete
    #@wash.attributes.delete([:created_at, :updated_at])
    #@wash.created_at = nil
    #@wash.updated_at = nil    
    #@wash.created_at = Time.now
    #@wash.updated_at = Time.now
    #logger.debug ">> @wash.attributes: #{@wash.attributes.inspect}"

    respond_to do |format|
      if @wash.save
        #logger.debug ">> params[:cloth].length: #{params[:cloth].length}"
        #logger.debug ">> params[:cloth][0]: #{params[:cloth][0]}" 
        for i in 0...params[:cloth].length do
          @cloth = Cloth.new( params[:cloth][i])
          next  if @cloth.count.to_i < 1
          @cloth.wash_id = @wash.id
          @cloth.status = YouCloth::STATUSES[0]
          @cloth.save
        end  
        format.html { redirect_to @wash, notice: 'Wash was successfully created.' }
        format.json { render json: @wash, status: :created, location: @wash }
      else
        format.html { render action: "new" }
        format.json { render json: @wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /washes/1
  # PUT /washes/1.json
  def update
    @wash = Wash.find(params[:id])

    respond_to do |format|
      if @wash.update_attributes(params[:wash])
        
        for i in 0...params[:cloth].length do
          cloth = Cloth.new( params[:cloth][i])
          cloth_id = params[:cloth][i][:id]
          #logger.debug ">> params[:cloth][#{i}][:id]: #{params[:cloth][i][:id]} "
          if cloth.count.to_i < 1
            Cloth.destroy(cloth_id) unless cloth_id.nil?
             next
           end
           
            if cloth_id.nil?
              #insert new record
              cloth.wash_id = @wash.id
              cloth.save 
              next
            end
            begin
              @cloth = Cloth.find(cloth_id)
              #@cloth.wash_id = @wash.id
              @cloth.update_attributes( params[:cloth][i])
            rescue  ActiveRecord::RecordNotFound => e
              logger.warn ">> RecordNotFound: #{e}"
              #insert new cloth
              #cloth.wash_id = @wash.id
              #cloth.save
            end
        end  # end of for
        
        format.html { redirect_to @wash, notice: 'Wash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /washes/1
  # DELETE /washes/1.json
  def destroy
    @wash = Wash.find(params[:id])
    @wash.destroy

    respond_to do |format|
      format.html { redirect_to washes_url }
      format.json { head :no_content }
    end
  end
  
  def customers
    q = "%#{params[:q].downcase}%"
    logger.debug ">> q: #{q}"
    @customers = Customer.joins(:user).where(" LOWER(name) LIKE ?  OR  LOWER(users.email) LIKE ?  OR LOWER(mobile) LIKE ? OR LOWER(phone) LIKE ? OR LOWER(address) LIKE ? OR LOWER(address2) LIKE ? ", q, q, q, q, q, q).limit(20).order('name')
    respond_to do |format|
      format.html { render :partial =>  "washes/customers", :object => @customers }
     end
  end
end
