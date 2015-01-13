class CheckoutController < ApplicationController
  def drop_in
    product = Product.find(params[:product_id])
    puts params.inspect
    result = Braintree::Transaction.sale(
      :amount => product.price / 100,
      :payment_method_nonce => params[:payment_method_nonce]
    )

    if result.success?
      flash[:success] = "Purchased #{product.name}!"
    else
      flash[:alert] = "Error'd processing transaction"
    end

    redirect_to products_path
  end
end
