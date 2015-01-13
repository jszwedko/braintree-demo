require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get checkout_drop_in" do
    get :checkout_drop_in
    assert_response :success
  end

end
