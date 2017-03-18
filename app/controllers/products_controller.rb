class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).order(name: :asc)
    @products = @products.paginate(page: params[:page], per_page: params[:per_page])
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'products/report_products', pdf: 'report' }
    end
    authorize @products
  end

  def show
    authorize @product
  end

  def new
    @product = Product.new

    authorize @product
  end

  def edit
    authorize @product
  end

  def create
    @product = Product.new(product_params)

    authorize @product

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: t('messages.notice.product_create_success') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @product

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: t('messages.notice.product_update_success') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    authorize @product

    respond_to do |format|
      format.html { redirect_to products_url, notice: t('messages.notice.product_remove_success') }
      format.json { head :no_content }
    end
  end

  def search
    index
    render :index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:id, :name, :value)
  end

  def product_value
    params.require(:product).permit(:value)
  end
end
