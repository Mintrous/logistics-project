class DeliveriesController < ApplicationController
  def index
    deliveries = Delivery.all
    render json: deliveries
  end

  def create
    delivery = Delivery.new(delivery_params)
    if delivery.save
      render json: delivery, status: :created
    else
      render json: delivery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy!
    head :no_content
  end


  private

  def delivery_params
    params.require(:delivery).permit(:title, :x, :y)
  end
end
