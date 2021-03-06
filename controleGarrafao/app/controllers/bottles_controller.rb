class BottlesController < ApplicationController
  before_action :authorize_request
  before_action :set_bottle, only: [:show, :update, :destroy]

  # GET /bottles
  def index
    @bottles = Bottle.all

    render json: @bottles
  end

  # GET /bottles/1
  def show
    render json: @bottle
  end

  # POST /bottles
  def create
    @bottle = Bottle.new(bottle_params)

    if @bottle.save
      render json: @bottle, status: :created, location: @bottle
    else
      render json: @bottle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bottles/1
  def update
    if @bottle.update(bottle_params)
      render json: @bottle
    else
      render json: @bottle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bottles/1
  def destroy
    @bottle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bottle
      @bottle = Bottle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bottle_params
      params[:bottle][:client_bottles_attributes] ||= params[:bottle].delete :client_bottles
      params.require(:bottle).permit(:name,
          client_bottles_attributes: [:id, :quantity, :client_name, :_destroy])
    end
end
