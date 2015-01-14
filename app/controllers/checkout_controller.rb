class CheckoutController < ApplicationController
  def drop_in
    product = Product.find(params[:product_id])
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

  def transparent_redirect
    result = Braintree::TransparentRedirect.confirm(request.query_string)
    if result.success?
      flash[:success] = "Purchased!"
    else
      flash[:alert] = "Error'd processing transaction"
    end

    redirect_to products_path
  end

  def server_to_server
    product = Product.find(params[:product_id])
    result = Braintree::Transaction.sale(
      :amount => product.price / 100,
      :credit_card => params[:transaction][:credit_card],
    )

    if result.success?
      flash[:success] = "Purchased #{product.name}!"
    else
      flash[:alert] = "Error'd processing transaction"
    end

    redirect_to products_path
  end

  def encrypted
    product = Product.find(params[:product_id])
    result = Braintree::Transaction.sale(
      :amount => product.price / 100,
      :credit_card => params[:transaction][:credit_card],
    )

    if result.success?
      flash[:success] = "Purchased #{product.name}!"
    else
      flash[:alert] = "Error'd processing transaction"
    end

    redirect_to products_path
  end
end
