class PostsController < ApplicationController
  #include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TextHelper
  before_filter :authenticate_user!  
  # filter_resource_access :additional_collection => { :reply => :read }
  #filter_resource_access 

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.includes(:user).where("user_id =?", current_user.id).paginate(page: params[:page]).order(" updated_at DESC")
     q = params[:q]
    field = params[:field]
    #logger.debug ">> field: #{field}"
    if q.blank?
      @posts = Post.includes(:user).where("user_id =?", current_user.id).paginate(page: params[:page]).order(" updated_at DESC")
    else
      q.strip!
      field.strip!
      @posts = case field.to_sym
                when :updated_at
                    Post.includes(:user).where(" user_id = ? AND updated_at LIKE ?", current_user.id, "%#{q}%").paginate(page: params[:page]).order(" updated_at DESC")
                else #all
                  where = <<-DOCUMENT
                    user_id = ? AND (LOWER(title) LIKE ? OR LOWER(body) LIKE ?) 
                  DOCUMENT

                  Post.includes(:user).where( where, current_user.id, "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('updated_at DESC')
                end
    end #end of if

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.subject = truncate( strip_tags(@post.body),  length:250, omission: '...')

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.subject = truncate( strip_tags( params[:post][:body]),  length:250, omission: '...')

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
