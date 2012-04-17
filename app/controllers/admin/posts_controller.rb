require 'post'

class Admin::PostsController < ApplicationController
    include ActionView::Helpers::TextHelper
    before_filter :authenticate_user!  
    filter_resource_access
    layout "admin"

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    q = params[:q]
    field = params[:field]
    #logger.debug ">> field: #{field}"
    if q.blank?
      @posts = Post.includes(:user).paginate(page: params[:page]).order(" updated_at DESC")
    else
      q.strip!
      field.strip!
      @posts = case field.to_sym
                when :updated_at
                    Post.includes(:user).where(" updated_at LIKE ?", "%#{q}%").paginate(page: params[:page]).order(" updated_at DESC")
                else #all
                  where = <<-DOCUMENT
                    LOWER(title) LIKE ? OR LOWER(body) LIKE ? 
                  DOCUMENT

                  Post.includes(:user).where( where, "%#{q.downcase}%", "%#{q.downcase}%").paginate(:page => params[:page]).order('updated_at DESC')
                end
    end #end of if

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end #filt #filter_resource_accesser_resource_access
  end

  # GET /admin/posts/new
  # GET /admin/posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /admin/posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @post.subject = truncate( strip_tags(@post.body),  length:250, omission: '...')

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/posts/1
  # PUT /admin/posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.subject = truncate( strip_tags( params[:post][:body]),  length:250, omission: '...')

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end
end
