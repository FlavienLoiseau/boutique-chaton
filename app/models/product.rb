class Product < ApplicationRecord
    has_one_attached :image
    has_many :line_items
    validates_presence_of :title, :description, :price
end
