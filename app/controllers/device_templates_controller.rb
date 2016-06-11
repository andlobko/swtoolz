class DeviceTemplatesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /device_templates
  # GET /device_templates.json
  def index
    @device_templates = DeviceTemplate.all
  end

  # GET /device_templates/1
  # GET /device_templates/1.json
  def show
  end

  # GET /device_templates/new
  def new
    @device_template = DeviceTemplate.new
  end

  # GET /device_templates/1/edit
  def edit
  end

  # POST /device_templates
  # POST /device_templates.json
  def create
    @device_template = DeviceTemplate.new(device_template_params)

    respond_to do |format|
      if @device_template.save
        format.html { redirect_to @device_template, notice: 'Device template was successfully created.' }
        format.json { render :show, status: :created, location: @device_template }
      else
        format.html { render :new }
        format.json { render json: @device_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_templates/1
  # PATCH/PUT /device_templates/1.json
  def update
    respond_to do |format|
      if @device_template.update(device_template_params)
        format.html { redirect_to @device_template, notice: 'Device template was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_template }
      else
        format.html { render :edit }
        format.json { render json: @device_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_templates/1
  # DELETE /device_templates/1.json
  def destroy
    @device_template.destroy
    respond_to do |format|
      format.html { redirect_to device_templates_url, notice: 'Device template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_template
      @device_template = DeviceTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_template_params
      params.require(:device_template).permit(:name, :description)
    end
end
