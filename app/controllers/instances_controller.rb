class InstancesController < ApplicationController

  # GET /instances/new
  def new
    @instance = Instance.new
  end


  # POST /instances
  # POST /instances.json
  def create
    @instance = Instance.new(params[:instance])

    respond_to do |format|
      if @instance.save
        #format.html { redirect_to @instance, notice: 'Request was made.' }
        format.html { redirect_to instances_thanks_path, notice: 'Request was made.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # GET /instances/new
  def thanks

  end

end
