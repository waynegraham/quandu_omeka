class Admin::InstancesController < ApplicationController

  # GET /instances
  def index
    @instances = Instance.paginate(:page => params[:page])
  end

  # GET /instances/1
  def show
    @instance = Instance.find(params[:id])
  end

  # GET /instances/new
  def new
    @instance = Instance.new
  end

  # GET /instances/1/edit
  def edit
    @instance = Instance.find(params[:id])
  end

  # POST /instances
  # POST /instances.json
  def create
    @instance = Instance.new(params[:instance])

    respond_to do |format|
      if @instance.save
        #format.html { redirect_to @instance, notice: 'Request was made.' }
        format.html { redirect_to instances_admin_path, notice: 'Request was made.' }
      else
        format.html { render action: "new" }
      end
    end
  end

 # GET /instances/new
  def thanks
    
  end

  # PUT /instances/1
  # PUT /instances/1.json
  def update
    @instance = Instance.find(params[:id])

    respond_to do |format|
      if @instance.update_attributes(params[:instance])
        format.html { redirect_to [:admin, @instance], notice: 'Instance was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /instances/1
  # DELETE /instances/1.json
  def destroy
    @instance = Instance.find(params[:id])
    @instance.destroy

    respond_to do |format|
      format.html { redirect_to instances_url }
      format.json { head :no_content }
    end
  end
end
