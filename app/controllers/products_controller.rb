class ProductsController < ApplicationController
  before_action :set_product, only: [:buy_drop_in]

  def index
    @products = Product.all
  end

  def buy_drop_in
    @client_token = Braintree::ClientToken.generate()
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
