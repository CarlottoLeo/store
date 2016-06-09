class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /orders
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result.includes(:person).order(id: :asc)
    @orders = @orders.paginate(page: params[:page], per_page: params[:per_page])
  end

  # GET /orders/1
  def show
    authorize @order
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new
    @order.person = Person.find(order_params[:person_id])

    order_params[:items_attributes].each do |k, v|
      @order.items.new(v)
    end

    authorize @order

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: t('messages.notice.order_create_success') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
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
      params.require(:order).permit(:person_id, :items_attributes => [:prodid, :amount, :value, :total, :_destroy])
    end
end
