class Image < ApplicationRecord
  belongs_to :product
  # validates :image, url: {presence: true}
end
