class Basket < ApplicationRecord

  def products
    _products = []
    _items = (self.items || "").split(",")
    _items.each do |item|
      p = Product.find_by_id(item)
      products.push(p) unless p.blank?
    end
    return _products
  end

  def scan(product)
    _items = (self.items || "").split(",")
    _items.push(product.code)
    self.items = _items.join(",")
  end

  def scan!(product)
    self.scan(product)
    self.save
  end

  def subtotal
    self.products.map(&:price).inject(:+)
  end
  
  def vat_total
    self.products.map(&:vat_price).inject(:+)
  end

  def grand_total
    _gt = self.subtotal + self.vat_total

    if _gt > 70
      _gt = _gt * 0.88
    end

    return_gt
  end
end
