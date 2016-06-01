class IpAddrsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  #before_action :set_ip_addr, only: [:show, :edit, :update, :destroy]
  before_action :set_subnet, only: [:show, :edit, :update, :destroy]


  # GET /ip_addrs/1
  # GET /ip_addrs/1.json
  def show
  end

  # GET /ip_addrs/1/edit
  def edit
  end

  # PATCH/PUT /ip_addrs/1
  # PATCH/PUT /ip_addrs/1.json
  def update
    respond_to do |format|
      if @ip_addr.update(ip_addr_params)
        format.html {
          flash[:success] = 'Ip addr was successfully updated.'
          redirect_to @ip_addr
        }
        format.json { render :show, status: :ok, location: @ip_addr }
      else
        format.html { render :edit }
        format.json { render json: @ip_addr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_addrs/1
  # DELETE /ip_addrs/1.json
  def destroy
    @ip_addr.free
    respond_to do |format|
      format.html {
        flash[:success] = 'Ip addr was successfully set free.'
        redirect_to @subnet
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_addr
      @ip_addr = IpAddr.find(params[:id])
    end
    def set_subnet
      @subnet = @ip_addr.subnet
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_addr_params
      params.require(:ip_addr).permit(:ip, :description)
    end
end
