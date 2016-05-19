class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /orders
  def index
    @orders = Order.filter_by_user(current_user.id)
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @user  = current_user
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new_with_products(current_user, order_params)

    authorize @order

    respond_to do |format|
      if @order && @order.save
        format.html { redirect_to @order, notice: t('messages.notice.order_create_success') }
        format.js   { redirect_to @order, notice: t('messages.notice.order_create_success') }
      else
        format.html { redirect_to new_order_path, alert: t('messages.error.order_create_empty_cart')}
        format.js   { redirect_to new_order_path, alert: t('messages.error.order_create_empty_cart')}
        format.json { render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /orders/1
  #def update
  #  respond_to do |format|
  #    if @order.update(order_params)
  #      format.html { redirect_to @order, notice: t('messages.notice.order_update_success') }
  #      format.json { render json: @order.to_json, status: :ok, location: @order }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @order.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /orders/1
  def destroy
    @order.destroy

    authorize @order

    respond_to do |format|
      format.js   { redirect_to orders_url, notice: t('messages.notice.order_remove_success') }
      format.html { redirect_to orders_url, notice: t('messages.notice.order_remove_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:items_attributes => [:id, :name, :amount, :value, :total, :done, :_destroy])
    end
end
