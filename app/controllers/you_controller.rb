class YouController < ApplicationController
  before_filter :authenticate_user!	
  #filter_resource_access
  def index
    q = params[:q]
    field = params[:field]
    #logger.debug ">> field: #{field}"
    if q.blank?
      @washes = Wash.where('email = ?', current_user.email).paginate(:page => params[:page]).order('stocked_on DESC, id ASC')
    else
      q.strip!
      field.strip!
      @washes = case field.to_sym
                when :name
                  Wash.where(" email = ? AND LOWER(name) LIKE ? ", current_user.email, "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                 when :email
                  Wash.where(" email = ? AND LOWER(email) LIKE ? ", current_user.email, "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                 when :phone
                  Wash.where("email = ? AND (phone LIKE ? OR mobile LIKE ?) ", current_user.email, "%#{q}%", "%#{q}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                when :address
                  Wash.where("email = ? AND (LOWER(address) LIKE ? OR LOWER(address2) LIKE ?) ", current_user.email, "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                when :stocked_on
                  Wash.where("email = ? AND stocked_on LIKE ? ", current_user.email, "%#{q}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                 when :released_on
                  Wash.where("email = ? AND released_on LIKE ? ", current_user.email, "%#{q}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                when :status
                  Wash.where("email = ? AND LOWER(status) LIKE ? ", current_user.email, "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, created_at ASC')
                else #all
                  where = <<-DOCUMENT
                    email = ? AND (LOWER(name) LIKE ? OR LOWER(email) LIKE ? 
                    OR phone LIKE ? OR mobile LIKE ? 
                    OR LOWER(address) LIKE ? OR LOWER(address2) LIKE ?  
                    OR LOWER(status) LIKE ?)  
                  DOCUMENT

                  Wash.where( where, current_user.email, "%#{q.downcase}%", "%#{q.downcase}%", "%#{q}%", "%#{q}%", "%#{q.downcase}%", "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('stocked_on DESC, id ASC')
                end
    end #end of if
    #@show_pagination = @washes.length > 0 && @washes.total_pages > 1
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @washes }
    end
  end

  def show
     #@wash = Wash.includes(:cloths).joins(:customer).where("washes.id = ? AND customers.user_id = ?", params[:id], current_user.id)
     @wash = Wash.joins(:customer).where("customers.user_id =?", current_user.id).find(params[:id])
     #@wash =  Wash.find_by_sql("SELECT `washes`.* FROM `washes` LEFT OUTER JOIN `customers` ON `customers`.`id` = `washes`.`customer_id` WHERE (washes.id = '38' AND customers.user_id = 34) LIMIT 1")
    respond_to do |format|
      format.html # sExtractedExtractedhow.html.erb
      format.json { render json: @wash }
    end
  end

  def profile
  end

  # def posts
  #  @posts = Post.includes(:user).where("user_id =?", current_user.id).paginate(page: params[:page]).order(" updated_at DESC")
  # end

end
