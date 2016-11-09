class CheckoutController < ApplicationController
  before_filter :fetch_basket

  # GET /checkout
  def show
  end

  # GET|POST /checkout/scan/:product_code
  def scan
    product = Product.find_by_code(params[:product_code])
    unless product.blank?
      @basket.scan!(product)
      session[:basket_id] = @basket.id
    else
      flash[:error] = "Item not found"
    end
    redirect_to checkout_path and return
  end

  private
  def fetch_basket
    @basket = Basket.find_by_id(session[:basket_id]) || Basket.new
  end
end
