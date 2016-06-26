class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    # Search
    @orders = @orders.search(params[:q]) if params[:q]

    # Order by
    @orders = @orders.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
      @orders = @orders.page(1).per(params[:limit]).padding(params[:offset])
    else
      @orders = @orders.page(1).per(25)
    end

    render json: @orders if stale?(etag: @orders.all, last_modified: @orders.maximum(:updated_at))
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    render json: @order if stale?(@order)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created

      @items = eval(@order.order)

      @items.each do |item|
        logger.debug item
        @product = Product.find_by(id: item['product'])
        @product.quantity = @product.quantity - item['quantity']
        @product.save
      end

    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params)
      head :no_content
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy

    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:customer_name, :customer_phone, {order: [:product, :quantity]})
  end
end
