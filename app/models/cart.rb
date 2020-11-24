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

    def add_product(product)
        item = self.line_items.find_by(product_id: product)
        if item
            item.quantity += 1
        else
            item = line_items.new(product: product)
        end
        return item
    end

end
