class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  def sale_message
    if price.to_i <= 2
      'Discount item!'
    else
      'Everyday vaule!'
    end
  end

  def tax
    tax = price.to_i * 0.09
  end

  def total
    total = price.to_i + tax
  end
end
