class Cart < ApplicationRecord
    belongs_to :user
    has_many :line_items

    def total
        total = 0
        self.line_items.each do |line_item|
            total += (line_item.quantity * line_item.product.price)
        end
        return total
    end
end
