class ClothsController < ApplicationController
 before_filter :authenticate_user!  
   #filter_resource_access :additional_collection => { :users => :read }
  filter_resource_access 
  # GET /cloths
  # GET /cloths.json
  def index
    @cloths = Cloth.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cloths }
    end
  end

  # GET /cloths/1
  # GET /cloths/1.json
  def show
    @cloth = Cloth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cloth }
    end
  end

  # GET /cloths/new
  # GET /cloths/new.json
  def new
    @cloth = Cloth.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cloth }
    end
  end

  # GET /cloths/1/edit
  def edit
    @cloth = Cloth.find(params[:id])
  end

  # POST /cloths
  # POST /cloths.json
  def create
    @cloth = Cloth.new(params[:cloth])

    respond_to do |format|
      if @cloth.save
        format.html { redirect_to @cloth, notice: 'Cloth was successfully created.' }
        format.json { render json: @cloth, status: :created, location: @cloth }
      else
        format.html { render action: "new" }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cloths/1
  # PUT /cloths/1.json
  def update
    @cloth = Cloth.find(params[:id])

    respond_to do |format|
      if @cloth.update_attributes(params[:cloth])
        format.html { redirect_to @cloth, notice: 'Cloth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloths/1
  # DELETE /cloths/1.json
  def destroy
    @cloth = Cloth.find(params[:id])
    @cloth.destroy

    respond_to do |format|
      format.html { redirect_to cloths_url }
      format.json { head :no_content }
    end
  end
end
