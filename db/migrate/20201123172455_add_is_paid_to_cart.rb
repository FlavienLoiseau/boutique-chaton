class AddIsPaidToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :is_paid, :boolean, default: false
  end
end
