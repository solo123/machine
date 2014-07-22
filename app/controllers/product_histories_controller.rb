class ProductHistoriesController < ApplicationController
  before_action :set_product_history, only: [:show, :edit, :update, :destroy]

  # GET /product_histories
  # GET /product_histories.json
  def index
    @product_histories = ProductHistory.all
  end

  # GET /product_histories/1
  # GET /product_histories/1.json
  def show
  end

  # GET /product_histories/new
  def new
    @product_history = ProductHistory.new
  end

  # GET /product_histories/1/edit
  def edit
  end

  # POST /product_histories
  # POST /product_histories.json
  def create
    @product_history = ProductHistory.new(product_history_params)

    respond_to do |format|
      if @product_history.save
        format.html { redirect_to @product_history, notice: 'Product history was successfully created.' }
        format.json { render :show, status: :created, location: @product_history }
      else
        format.html { render :new }
        format.json { render json: @product_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_histories/1
  # PATCH/PUT /product_histories/1.json
  def update
    respond_to do |format|
      if @product_history.update(product_history_params)
        format.html { redirect_to @product_history, notice: 'Product history was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_history }
      else
        format.html { render :edit }
        format.json { render json: @product_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_histories/1
  # DELETE /product_histories/1.json
  def destroy
    @product_history.destroy
    respond_to do |format|
      format.html { redirect_to product_histories_url, notice: 'Product history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_history
      @product_history = ProductHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_history_params
      params.require(:product_history).permit(:product_id, :godown_entry_id, :godown_entry_id, :order_id, :before_items, :change_items, :now_items, :employee_id)
    end
end
