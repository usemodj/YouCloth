class ClothItemsController < ApplicationController
  before_filter :authenticate_user!  
   #filter_resource_access :additional_collection => { :users => :read }
  filter_resource_access 
  layout "admin"

    # GET /cloth_items
  # GET /cloth_items.json
  def index
   # @cloth_items = ClothItem.all
    @cloth_items = ClothItem.order(' no ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cloth_items }
    end
  end

  # GET /cloth_items/1
  # GET /cloth_items/1.json
  def show
    @cloth_item = ClothItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cloth_item }
    end
  end

  # GET /cloth_items/new
  # GET /cloth_items/new.json
  def new
    @cloth_item = ClothItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cloth_item }
    end
  end

  # GET /cloth_items/1/edit
  def edit
    @cloth_item = ClothItem.find(params[:id])
  end

  # POST /cloth_items
  # POST /cloth_items.json
  def create
    @cloth_item = ClothItem.new(params[:cloth_item])

    respond_to do |format|
      if @cloth_item.save
        format.html { redirect_to @cloth_item, notice: 'Cloth item was successfully created.' }
        format.json { render json: @cloth_item, status: :created, location: @cloth_item }
      else
        format.html { render action: "new" }
        format.json { render json: @cloth_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cloth_items/1
  # PUT /cloth_items/1.json
  def update
    @cloth_item = ClothItem.find(params[:id])

    respond_to do |format|
      if @cloth_item.update_attributes(params[:cloth_item])
        format.html { redirect_to @cloth_item, notice: 'Cloth item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cloth_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloth_items/1
  # DELETE /cloth_items/1.json
  def destroy
    @cloth_item = ClothItem.find(params[:id])
    @cloth_item.destroy

    respond_to do |format|
      format.html { redirect_to cloth_items_url }
      format.json { head :no_content }
    end
  end
end
