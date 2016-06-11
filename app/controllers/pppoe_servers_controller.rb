class PppoeServersController < ApplicationController
  before_action :set_pppoe_server, only: [:show, :edit, :update, :destroy]

  # GET /pppoe_servers
  # GET /pppoe_servers.json
  def index
    @pppoe_servers = PppoeServer.all
  end

  # GET /pppoe_servers/1
  # GET /pppoe_servers/1.json
  def show
  end

  # GET /pppoe_servers/new
  def new
    @pppoe_server = PppoeServer.new
  end

  # GET /pppoe_servers/1/edit
  def edit
  end

  # POST /pppoe_servers
  # POST /pppoe_servers.json
  def create
    @pppoe_server = PppoeServer.new(pppoe_server_params)

    respond_to do |format|
      if @pppoe_server.save
        format.html { redirect_to @pppoe_server, notice: 'Pppoe server was successfully created.' }
        format.json { render :show, status: :created, location: @pppoe_server }
      else
        format.html { render :new }
        format.json { render json: @pppoe_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pppoe_servers/1
  # PATCH/PUT /pppoe_servers/1.json
  def update
    respond_to do |format|
      if @pppoe_server.update(pppoe_server_params)
        format.html { redirect_to @pppoe_server, notice: 'Pppoe server was successfully updated.' }
        format.json { render :show, status: :ok, location: @pppoe_server }
      else
        format.html { render :edit }
        format.json { render json: @pppoe_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pppoe_servers/1
  # DELETE /pppoe_servers/1.json
  def destroy
    @pppoe_server.destroy
    respond_to do |format|
      format.html { redirect_to pppoe_servers_url, notice: 'Pppoe server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pppoe_server
      @pppoe_server = PppoeServer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pppoe_server_params
      params.require(:pppoe_server).permit(:name, :description, :address, :telnet_password, :snmp_password, :snmp_user)
    end
end
