class CheckoutController < ApplicationController
  before_filter :fetch_basket

  # GET /checkout
  def show
  end

  # GET|POST /checkout/scan/:product_code
  def scan
    missing_products = []
    params[:product_code].split(",").map(&:strip).each do |code|
      product = Product.find_by_code(code)
      unless product.blank?
        @basket.scan(product)
      else
        missing_products.push(code)
      end
    end

    flash[:error] = "One or more products could not be found: #{missing_products.join(", ")}"
    
    session[:basket_id] = @basket.id if @basket.save
    redirect_to checkout_path and return
  end

  private
  def fetch_basket
    @basket = Basket.find_by_id(session[:basket_id]) || Basket.new
  end
end
