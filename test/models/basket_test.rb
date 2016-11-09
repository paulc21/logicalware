require 'test_helper'

class BasketTest < ActiveSupport::TestCase
  test "total with products 001_002_003" do
    basket = Basket.new
    basket.scan(Product.find_by_code("001"))
    basket.scan(Product.find_by_code("002"))
    basket.scan(Product.find_by_code("003"))

    assert basket.total.round(2) == "66.4".to_d
  end

  test "total with products 002_001_002" do
    basket = Basket.new
    basket.scan(Product.find_by_code("002"))
    basket.scan(Product.find_by_code("001"))
    basket.scan(Product.find_by_code("002"))

    assert basket.total.round(2) == "80.25".to_d
  end

  test "total with products 003_001_002_001" do
    basket = Basket.new
    basket.scan(Product.find_by_code("003"))
    basket.scan(Product.find_by_code("001"))
    basket.scan(Product.find_by_code("002"))
    basket.scan(Product.find_by_code("001"))

    assert basket.total.round(2) == "71.63".to_d
  end
end
