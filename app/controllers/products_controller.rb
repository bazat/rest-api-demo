class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    # Search
    @products = @products.search(params[:q]) if params[:q]

    # Order by
    @products = @products.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
      @products = @products.page(1).per(params[:limit]).padding(params[:offset])
    else
      @products = @products.page(1).per(25)
    end

    render json: @products if stale?(etag: @products.all, last_modified: @products.maximum(:updated_at))
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: @product if stale?(@product)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy

    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :email, :twitter)
  end
end
