class Basket < ApplicationRecord

  def contents
    JSON.parse(self.items || "[]").map{|i| i.symbolize_keys }
  end

  def scan(product)
    _items = self.contents

    others = _items.select{|i| i[:code] == product.code }.count

    new_item = {
      code: product.code,
      name: product.name,
      price: product.price(others),
      vat_rate: VAT_RATES[product.vat_rate]
    }

    _items.push(new_item)
    self.items = _items.to_json
  end

  def scan!(product)
    self.scan(product)
    self.save
  end

  def subtotal
    self.contents.map{|i| i[:price].to_d }.inject(:+)
  end
  
  def vat_total
    self.contents.map{|i| i[:price].to_d * i[:vat_rate] }.inject(:+)
  end

  def discount(limit=70,discount=0.12)
    if (self.subtotal + self.vat_total) >= limit
      return (self.subtotal + self.vat_total) * discount
    else
      return 0
    end
  end

  def total
    self.subtotal + self.vat_total - self.discount
  end
end
