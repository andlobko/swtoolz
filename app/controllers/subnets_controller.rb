class SubnetsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_subnet, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /subnets
  # GET /subnets.json
  def index
    @subnets = Subnet.all
  end

  # GET /subnets/1
  # GET /subnets/1.json
  def show
  end

  # GET /subnets/new
  def new
    @subnet = Subnet.new
  end

  # GET /subnets/1/edit
  def edit
  end

  # POST /subnets
  # POST /subnets.json
  def create
    @subnet = Subnet.new(subnet_params)

    respond_to do |format|
      if @subnet.save
        format.html {
          flash[:success] = "Subnet was successfully created."
          redirect_to subnets_url
        }
        format.json { render :show, status: :created, location: @subnet }
      else
        format.html { render :new }
        format.json { render json: @subnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subnets/1
  # PATCH/PUT /subnets/1.json
  def update
    respond_to do |format|
      if @subnet.update(subnet_params)
        format.html {
          flash[:success] = "Subnet was successfully updated."
          redirect_to subnets_url
        }
        format.json { render :show, status: :ok, location: @subnet }
      else
        format.html { render :edit }
        format.json { render json: @subnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subnets/1
  # DELETE /subnets/1.json
  def destroy
    @subnet.destroy
    respond_to do |format|
      format.html {
        redirect_to subnets_url
        flash[:success] = 'Subnet was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subnet
      @subnet = Subnet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subnet_params
      params.require(:subnet).permit(:subnet_addr, :description)
    end
end
