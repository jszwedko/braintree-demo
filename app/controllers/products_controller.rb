class ProductsController < ApplicationController
  before_action :set_product, only: [:buy_drop_in, :buy_transparent_redirect]

  def index
    @products = Product.all
  end

  def buy_drop_in
    @client_token = Braintree::ClientToken.generate()
  end

  def buy_transparent_redirect
    @tr_data = Braintree::TransparentRedirect.transaction_data(
      :redirect_url => "#{request.protocol}#{request.host}:#{request.port}#{checkout_transparent_redirect_path}",
      :transaction => {
        :type => "sale",
        :amount => @product.price / 100
      }
    )
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
