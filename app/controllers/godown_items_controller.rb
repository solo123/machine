class GodownItemsController < ApplicationController
  before_action :set_godown_item, only: [:show, :edit, :update, :destroy]

  # GET /godown_items
  # GET /godown_items.json
  def index
    @godown_items = GodownItem.all
  end

  # GET /godown_items/1
  # GET /godown_items/1.json
  def show
  end

  # GET /godown_items/new
  def new
    @godown_item = GodownItem.new
  end

  # GET /godown_items/1/edit
  def edit
  end

  # POST /godown_items
  # POST /godown_items.json
  def create
    @godown_item = GodownItem.new(godown_item_params)

    respond_to do |format|
      if @godown_item.save
        format.html { redirect_to @godown_item, notice: 'Godown item was successfully created.' }
        format.json { render :show, status: :created, location: @godown_item }
      else
        format.html { render :new }
        format.json { render json: @godown_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /godown_items/1
  # PATCH/PUT /godown_items/1.json
  def update
    respond_to do |format|
      if @godown_item.update(godown_item_params)
        format.html { redirect_to @godown_item, notice: 'Godown item was successfully updated.' }
        format.json { render :show, status: :ok, location: @godown_item }
      else
        format.html { render :edit }
        format.json { render json: @godown_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /godown_items/1
  # DELETE /godown_items/1.json
  def destroy
    @godown_item.destroy
    respond_to do |format|
      format.html { redirect_to godown_items_url, notice: 'Godown item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_godown_item
      @godown_item = GodownItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def godown_item_params
      params.require(:godown_item).permit(:godown_entry_id, :product_id, :terminal_code, :model, :sn_code, :price, :items, :amount, :status)
    end
end
