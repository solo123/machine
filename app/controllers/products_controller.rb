class ProductsController < ResourcesController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :catalog, :sale_price, :status)
    end
end
