class Product < ApplicationRecord

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true
  validate :vat_rate_valid

  before_validation :set_vat_rate, on: :create

  def vat_price
    self.price * (VAT_RATES[self.vat_rate])
  end

  private
  def vat_rate_valid
    unless VAT_RATES.keys.include?(self.vat_rate)
      self.errors.add(:vat_rate, "is invalid")
    end
  end

  def set_vat_rate
    self.vat_rate ||= "standard"
  end

end
