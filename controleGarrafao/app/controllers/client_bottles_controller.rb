class ClientBottlesController < ApplicationController
  before_action :set_client_bottle, only: [:show, :update, :destroy]

  # GET /client_bottles
  def index
    @client_bottles = ClientBottle.all

    render json: @client_bottles
  end

  # GET /client_bottles/1
  def show
    render json: @client_bottle
  end

  # POST /client_bottles
  def create
    @client_bottle = ClientBottle.new(client_bottle_params)

    if @client_bottle.save
      render json: @client_bottle, status: :created, location: @client_bottle
    else
      render json: @client_bottle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_bottles/1
  def update
    if @client_bottle.update(client_bottle_params)
      render json: @client_bottle
    else
      render json: @client_bottle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_bottles/1
  def destroy
    @client_bottle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_bottle
      @client_bottle = ClientBottle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_bottle_params
      params.require(:client_bottle).permit(:quantity, :client_id, :bottle_id)
    end
end
