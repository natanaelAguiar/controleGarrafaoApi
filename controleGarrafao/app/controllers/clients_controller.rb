class ClientsController < ApplicationController
  before_action :authorize_request
  before_action :set_client, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /clients
  def index
    @clients = Client.all

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params[:client][:client_bottles_attributes] ||= params[:client].delete :client_bottles
      params.require(:client).permit(:id, :name, :street, :number, :rmk,
              client_bottles_attributes: [:id, :bottle, :quantity, :_destroy])
    end
end
