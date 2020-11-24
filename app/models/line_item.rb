class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart

    def line_item_total
        self.product.price * self.quantity
    end

end
